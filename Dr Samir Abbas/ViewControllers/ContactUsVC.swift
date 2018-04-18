//
//  GalleryVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 10/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import Material
import TangramKit
import FSPagerView
import MGRelativeKit
import GoogleMaps

class ContactUsVC : BaseVC{
    
    let gallery = [#imageLiteral(resourceName: "sameer_abbas_gallery_1_1"), #imageLiteral(resourceName: "sameer_abbas_gallery_2_2"), #imageLiteral(resourceName: "sameer_abbas_gallery_3_3"), #imageLiteral(resourceName: "sameer_abbas_gallery_4_4"), #imageLiteral(resourceName: "sameer_abbas_gallery_5_5"), #imageLiteral(resourceName: "sameer_abbas_gallery_6_6"), #imageLiteral(resourceName: "sameer_abbas_gallery_7_7"), #imageLiteral(resourceName: "sameer_abbas_gallery_8_8")]
    
    var scrollHeight : CGFloat!
    
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        scrollHeight = 0
        
        
        
        let linear = TGLinearLayout(.vert)
        linear.tg_width.equal(UIScreen.main.bounds.width)
        linear.tg_height.equal(.wrap)
        linear.backgroundColor = Style.BackgroundColor
        linear.addSubview(getToolbar(title: "Contact us", isBackMenu: true, addSpinner : false))
        var image = UIImage(named: "strip.png")
        image = image?.resize(toHeight: 3)
        image = image?.resize(toWidth: UIScreen.main.bounds.width)
        
        let strip = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 3))
        strip.image = image
        strip.contentMode = UIViewContentMode.scaleAspectFill
        strip.tg_top.equal(8)
        //....
        
        linear.addSubview(strip)
        view.backgroundColor = Style.BackgroundColor
        
        let banner = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Style.ScreenHeight / 4))
        banner.image = #imageLiteral(resourceName: "contact_us_samir_abbas")
        banner.contentMode = UIViewContentMode.scaleAspectFill
        scrollHeight = scrollHeight + Style.ScreenHeight / 4
        
        
        let address = getUILabel(text: "ADDRESS", size: Style.TextSize16, textColor: Style.AccentColor)
        let addr = TGLinearLayout(.vert)
        addr.tg_width.equal(Style.ScreenWidth)
        addr.tg_height.equal(.wrap)
        addr.addSubview(address)
        addr.tg_top.equal(Style.ScreenHeight / 2 )
        
        let navStrip = UIImageView()
        navStrip.tg_width.equal(Style.ScreenWidth - 60)
        navStrip.tg_height.equal(3)
        navStrip.image = #imageLiteral(resourceName: "nav_strip")
        navStrip.tg_top.equal(3)
        navStrip.tg_centerX.equal(0)
        addr.addSubview(navStrip)
        
        let addrLabel = getUILabel(text: "Head Office Jeddah - Ash Shati District Alkurnaysh Road\nZip Code 23411 Tel 012 618 7777 TollFree 920012525\nEmail info@dsah.sa Website www.dsah.sa", size: Style.TextSize18, textColor: UIColor().HexToColor(hexString: "#3c7fd1"))
        addrLabel.tg_top.equal(10)
        addrLabel.tg_left.equal(10)
        addrLabel.tg_right.equal(10)
        addr.addSubview(addrLabel)
        
        let ph = getUILabel(text: "PHONE NO", size: Style.TextSize16, textColor: Style.AccentColor)
        ph.tg_top.equal(Style.Height20)
        addr.addSubview(ph)
        
        let navStrip2 = UIImageView()
        navStrip2.tg_width.equal(Style.ScreenWidth - 60)
        navStrip2.tg_height.equal(3)
        navStrip2.image = #imageLiteral(resourceName: "nav_strip")
        navStrip2.tg_top.equal(3)
        navStrip2.tg_centerX.equal(0)
        addr.addSubview(navStrip2)
        
        let no = getUILabel(text: "+ 966126187777", size: Style.TextSize18, textColor: UIColor().HexToColor(hexString: "#3c7fd1"))
        no.tg_top.equal(10)
        addr.addSubview(no)
        
        let em = getUILabel(text: "EMAIL", size: Style.TextSize16, textColor: Style.AccentColor)
        em.tg_top.equal(Style.Height20)
        addr.addSubview(em)
        
        let navStrip3 = UIImageView()
        navStrip3.tg_width.equal(Style.ScreenWidth - 60)
        navStrip3.tg_height.equal(3)
        navStrip3.image = #imageLiteral(resourceName: "nav_strip")
        navStrip3.tg_top.equal(3)
        navStrip3.tg_centerX.equal(0)
        
        addr.addSubview(navStrip3)
        
        let email = getUILabel(text: "badar.abbas@dshah.sa", size: Style.TextSize18, textColor: UIColor().HexToColor(hexString: "#3c7fd1"))
        email.tg_top.equal(10)
        addr.addSubview(email)
        
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.tg_width.equal(Style.ScreenWidth)
        mapView.tg_height.equal(Style.ScreenHeight / 4)
        mapView.tg_top.equal(20)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
        
        addr.addSubview(mapView)
        
        var ll = LinearLayout(width: MATCH_PARENT, height: Style.ScreenHeight * 1.2).vertical()
        ll.padding(left: 0, right: 0, top: Style.Height110, bottom: 0)
        ll.add(view: banner, w: MATCH_PARENT, h: Style.ScreenHeight / 4)
        ll.add(view: addr, w: MATCH_PARENT, h: Style.Height20)
        
        
        
        
        view.addSubview(ll.createScrollable())
        view.addSubview(linear)
        menuButton.addTarget(self, action: #selector(onBackPressed), for: .touchUpInside)
    }
    
    @objc
    func onBackPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func getUILabel(text : String, size : CGFloat, textColor : UIColor) -> UILabel{
        let label = UILabel()
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: size)]
        let attributedString = NSMutableAttributedString(string: text, attributes:attrs)
        label.tg_width.equal(UIScreen.main.bounds.width)
        label.tg_height.equal(.wrap)
        label.textAlignment = .center
        label.textColor = textColor
        label.attributedText = attributedString
        return label
    }
    
    
}



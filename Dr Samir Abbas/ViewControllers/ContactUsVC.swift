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
    
    var scrollHeight : CGFloat!
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        scrollHeight = 0
        
        
        
        let linear = TGLinearLayout(.vert)
        linear.tg_width.equal(UIScreen.main.bounds.width)
        linear.tg_height.equal(.wrap)
        linear.backgroundColor = Style.BackgroundColor
        linear.addSubview(getToolbar(title: "contact_us".localizedString, isBackMenu: true, addSpinner : false))
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
        
        
        let address = getUILabel(text: "adress".localizedString, size: Style.TextSize16, textColor: Style.AccentColor)
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
        
        var addressStr = "head_office_jeddah".localizedString
        addressStr.append("\n")
        addressStr.append("address".localizedString)
        
        let addrLabel = getUILabel(text: addressStr, size: Style.TextSize18, textColor: Style.TextColor)
        addrLabel.tg_top.equal(10)
        addrLabel.tg_left.equal(10)
        addrLabel.tg_right.equal(10)
        addr.addSubview(addrLabel)
        
        let ph = getUILabel(text: "phone_no".localizedString, size: Style.TextSize16, textColor: Style.AccentColor)
        ph.tg_top.equal(Style.Height20)
        addr.addSubview(ph)
        
        let navStrip2 = UIImageView()
        navStrip2.tg_width.equal(Style.ScreenWidth - 60)
        navStrip2.tg_height.equal(3)
        navStrip2.image = #imageLiteral(resourceName: "nav_strip")
        navStrip2.tg_top.equal(3)
        navStrip2.tg_centerX.equal(0)
        addr.addSubview(navStrip2)
        
        let no = getUILabel(text: "number".localizedString, size: Style.TextSize18, textColor: Style.TextColor)
        no.tg_top.equal(10)
        addr.addSubview(no)
        
        let em = getUILabel(text: "email".localizedString, size: Style.TextSize16, textColor: Style.AccentColor)
        em.tg_top.equal(Style.Height20)
        addr.addSubview(em)
        
        let navStrip3 = UIImageView()
        navStrip3.tg_width.equal(Style.ScreenWidth - 60)
        navStrip3.tg_height.equal(3)
        navStrip3.image = #imageLiteral(resourceName: "nav_strip")
        navStrip3.tg_top.equal(3)
        navStrip3.tg_centerX.equal(0)
        
        addr.addSubview(navStrip3)
        
        var str = "info@dsah.sa"
        str.append("\n")
        str.append("badar.abbas@dshah.sa")
        let email = getUILabel(text: str, size: Style.TextSize18, textColor: Style.TextColor)
        email.tg_top.equal(10)
        addr.addSubview(email)
        
        
        
        
        let em2 = getUILabel(text: "website".localizedString, size: Style.TextSize16, textColor: Style.AccentColor)
        em2.tg_top.equal(Style.Height20)
        addr.addSubview(em2)
        
        let navStrip4 = UIImageView()
        navStrip4.tg_width.equal(Style.ScreenWidth - 60)
        navStrip4.tg_height.equal(3)
        navStrip4.image = #imageLiteral(resourceName: "nav_strip")
        navStrip4.tg_top.equal(3)
        navStrip4.tg_centerX.equal(0)
        
        addr.addSubview(navStrip4)
        
        var str1 = "http://www.dsah.sa"
        
        let email1 = getUILabel(text: str1, size: Style.TextSize18, textColor: Style.TextColor)
        email1.tg_top.equal(10)
        addr.addSubview(email1)
        
        
        
        
        
        let camera = GMSCameraPosition.camera(withLatitude:21.554039, longitude: 39.124523, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.tg_width.equal(Style.ScreenWidth)
        mapView.tg_height.equal(Style.ScreenHeight / 3.5)
        mapView.tg_top.equal(40)
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
        
        addr.addSubview(mapView)
        
        var ll = LinearLayout(width: MATCH_PARENT, height: Style.ScreenHeight * 1.3).vertical()
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



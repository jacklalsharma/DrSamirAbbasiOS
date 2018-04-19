//
//  AboutUsVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 19/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import TangramKit
import Material
import UIKit


class AboutUsVC : BaseVC{
    
    var scrollHeight : CGFloat!
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        scrollHeight = 0
        
        
        
        let linear = TGLinearLayout(.vert)
        linear.tg_width.equal(UIScreen.main.bounds.width)
        linear.tg_height.equal(.wrap)
        linear.backgroundColor = Style.BackgroundColor
        linear.addSubview(getToolbar(title: "About us", isBackMenu: true, addSpinner : false))
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
        
        let banner = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Style.ScreenHeight / 3.8))
        banner.image = #imageLiteral(resourceName: "contact_us_samir_abbas2-1")
        banner.contentMode = UIViewContentMode.scaleAspectFill
        scrollHeight = scrollHeight + Style.ScreenHeight / 3.8
        
        
        let address = getUILabel(text: "ADDRESS", size: Style.TextSize16, textColor: Style.AccentColor)
        let addr = TGLinearLayout(.vert)
        addr.tg_width.equal(Style.ScreenWidth)
        addr.tg_height.equal(.wrap)
        addr.addSubview(address)
        addr.tg_top.equal(Style.ScreenHeight / 2 )
        address.isHidden = true
        
        let navStrip = UIImageView()
        navStrip.tg_width.equal(Style.ScreenWidth - 60)
        navStrip.tg_height.equal(3)
        navStrip.image = #imageLiteral(resourceName: "nav_strip")
        navStrip.tg_top.equal(3)
        navStrip.tg_centerX.equal(0)
        addr.addSubview(navStrip)
        navStrip.isHidden = true
        
        let addrLabel = getUILabel(text: "Professor Samir Abbas, founder of the hospital, and owner of a number of\n women wellness centers kingdom-wise, is an authority in the field of infertility, reproductive endocrinology and women wellness.\nHe is well known international figure in the field of women's reproduction\n and assisted reproductive techniques, and was the first to facilitate a test\n tube baby in the arab and muslim world in 1986, he also performed the very\n first successful in-vitro fertilization procedure in the kingdom resulting in a\nhealthy neonate.", size: Style.TextSize18, textColor: UIColor().HexToColor(hexString: "#3c7fd1"))
        addrLabel.tg_top.equal(10)
        addrLabel.tg_left.equal(10)
        addrLabel.tg_right.equal(10)
        addr.addSubview(addrLabel)
        
        let ph = getUILabel(text: "Mission", size: Style.TextSize16, textColor: Style.AccentColor)
        ph.tg_top.equal(Style.Height20)
        addr.addSubview(ph)
        
        let navStrip2 = UIImageView()
        navStrip2.tg_width.equal(Style.ScreenWidth - 60)
        navStrip2.tg_height.equal(3)
        navStrip2.image = #imageLiteral(resourceName: "nav_strip")
        navStrip2.tg_top.equal(3)
        navStrip2.tg_centerX.equal(0)
        addr.addSubview(navStrip2)
        
        let no = getUILabel(text: "TO BE, AS WE ALWAYS WERE, PIONEER IN THE FIELD OF MEDICINE SEEKING\n DEVELOPMENT AND INITIATING CHANGE TO PROVIDE THE MOST ADVANCED SERVICES WE\n WELL EXTEND KNOWLEDGE AND CARE BEYOND THE LIMITS OF CONVENTIONAL PRACTICE AND\nCREATE A BOND OF TRUST WITH OUR PATIENTS AND THEIR FAMILIES.", size: Style.TextSize18, textColor: UIColor().HexToColor(hexString: "#3c7fd1"))
        no.tg_top.equal(10)
        addr.addSubview(no)
        
        let em = getUILabel(text: "Values", size: Style.TextSize16, textColor: Style.AccentColor)
        em.tg_top.equal(Style.Height20)
        addr.addSubview(em)
        
        let navStrip3 = UIImageView()
        navStrip3.tg_width.equal(Style.ScreenWidth - 60)
        navStrip3.tg_height.equal(3)
        navStrip3.image = #imageLiteral(resourceName: "nav_strip")
        navStrip3.tg_top.equal(3)
        navStrip3.tg_centerX.equal(0)
        
        addr.addSubview(navStrip3)
        
        let email = getUILabel(text: "• DEDICATED TO TO EVERY PATIENT.\n•CONSTANTLY SEEKING DEVELOPMENT\n•TO DEVELOP TRUST BETWEEN PATIENTS AND COLLEAGUES.\n•TO GIVE TO OUR COMMUNITY\n•TO ADHERE TO ISLAMIC MORALS AND ETHICS\n•TO DISSIPATE KNOWLEDGE AND AWARENESS.", size: Style.TextSize18, textColor: UIColor().HexToColor(hexString: "#3c7fd1"))
        email.tg_top.equal(10)
        addr.addSubview(email)
        
        
        var ll = LinearLayout(width: MATCH_PARENT, height: Style.ScreenHeight * 1.45).vertical()
        ll.padding(left: 0, right: 0, top: Style.Height120, bottom: 0)
        ll.add(view: banner, w: MATCH_PARENT, h: Style.ScreenHeight / 3.8)
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




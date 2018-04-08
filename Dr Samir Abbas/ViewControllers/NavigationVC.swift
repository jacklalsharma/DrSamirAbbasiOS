//
//  NavigationVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 08/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import Material
import TangramKit


class NavigationVC : BaseVC {
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        let relative = TGLinearLayout(.vert)
        relative.tg_width.equal(UIScreen.main.bounds.width)
        relative.tg_height.equal(UIScreen.main.bounds.height)

        relative.addSubview(getToolbar(title: "HOME", isBackMenu: false))
        view.addSubview(relative)
        relative.backgroundColor = Style.BackgroundColor
        
        //STRIP VIEW...
        var image = UIImage(named: "strip.png")
        image = image?.resize(toHeight: 3)
        image = image?.resize(toWidth: UIScreen.main.bounds.width)
        
        let strip = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 3))
        strip.image = image
        strip.contentMode = UIViewContentMode.scaleAspectFill
        strip.tg_top.equal(8)
        relative.addSubview(strip)
        //....
        
        
        //BANNER VIEW....
        let banner = TGRelativeLayout()
        banner.tg_width.equal(UIScreen.main.bounds.width)
        banner.tg_height.equal(160)
        let bannerImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 160))
        bannerImageView.image = #imageLiteral(resourceName: "banner")
        bannerImageView.contentMode = UIViewContentMode.scaleToFill
        banner.addSubview(bannerImageView)
        //.....
        
        //BOOK APPOINTMENT...
        let bookAppt = TGRelativeLayout()
        bookAppt.tg_centerX.equal(0)
        bookAppt.tg_width.equal(UIScreen.main.bounds.width - 40)
        bookAppt.tg_height.equal(120)
        bookAppt.tg_backgroundImage = #imageLiteral(resourceName: "btn_outer")
        bookAppt.tg_top.equal(20)
        bookAppt.backgroundColor = .white
        
        let bookApptLinear = TGLinearLayout(.vert)
        bookApptLinear.tg_width.equal(UIScreen.main.bounds.width - 40)
        bookApptLinear.tg_height.equal(120)
        bookApptLinear.tg_centerX.equal(0)
        
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 45, height: 60))
        img.image = #imageLiteral(resourceName: "ic_aapointment")
        img.tg_centerX.equal(0)
        img.tg_top.equal(10)
        bookApptLinear.addSubview(img)
        
        let bookLabel = UILabel()
        bookLabel.tg_width.equal(.wrap)
        bookLabel.tg_height.equal(.wrap)
        bookLabel.text = "Book An Appointment"
        bookLabel.tg_centerX.equal(0)
        bookLabel.tg_top.equal(8)
        bookLabel.textColor = Style.TextColor
        
        let bookBtn = FlatButton(title: "", titleColor: .white)
        bookBtn.tg_width.equal(UIScreen.main.bounds.width - 40)
        bookBtn.tg_height.equal(120)
        bookBtn.tg_centerX.equal(0)
        bookBtn.addTarget(self, action: #selector(openAppointment), for: .touchUpInside)
        bookApptLinear.addSubview(bookLabel)
        bookAppt.addSubview(bookApptLinear)
        bookAppt.addSubview(bookBtn)
        //....
        
        relative.addSubview(banner)
        relative.addSubview(bookAppt)
    }
    
    @objc
    func openAppointment(){
        //Opens the Booking Appointment VC...
        let book = BookAppointmentVC()
        present(book, animated: true, completion: nil)
    }
    
    
    
}

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

        relative.addSubview(getToolbar(title: "HOME", isBackMenu: false, showNotification : true))
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
        bookAppt.tg_height.equal(150)
        bookAppt.tg_backgroundImage = #imageLiteral(resourceName: "btn_outer")
        bookAppt.tg_top.equal(20)
        bookAppt.backgroundColor = .white
        
        let bookApptLinear = TGLinearLayout(.vert)
        bookApptLinear.tg_width.equal(UIScreen.main.bounds.width - 40)
        bookApptLinear.tg_height.equal(120)
        bookApptLinear.tg_centerX.equal(0)
        bookApptLinear.tg_centerY.equal(0)
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 65))
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
        bookBtn.tg_height.equal(150)
        bookBtn.tg_centerX.equal(0)
        bookBtn.addTarget(self, action: #selector(openAppointment), for: .touchUpInside)
        bookApptLinear.addSubview(bookLabel)
        bookAppt.addSubview(bookApptLinear)
        bookAppt.addSubview(bookBtn)
        //....
        
        relative.addSubview(banner)
        relative.addSubview(bookAppt)
        
        let l1 = TGLinearLayout(.horz)
        l1.tg_width.equal(UIScreen.main.bounds.width - 40)
        l1.tg_centerX.equal(0)
        l1.tg_top.equal(10)
        l1.tg_height.equal(.wrap)
        l1.addSubview(getSquareButton(position : 0))
        l1.addSubview(getSquareButton(position : 1))
        
        
        let l2 = TGLinearLayout(.horz)
        l2.tg_width.equal(UIScreen.main.bounds.width - 40)
        l2.tg_centerX.equal(0)
        l2.tg_height.equal(.wrap)
        l2.addSubview(getSquareButton(position : 2))
        l2.addSubview(getSquareButton(position : 3))
        l2.tg_top.equal(0)
        
        relative.addSubview(l1)
        relative.addSubview(l2)
    }
    
    @objc
    func openAppointment(){
        //Opens the Booking Appointment VC...
        let book = BookAppointmentVC()
        present(book, animated: true, completion: nil)
    }
    
    @objc
    func doctors(){
        
    }
    
    @objc
    func services(){
        
    }
    
    @objc
    func facilities(){
        
    }
    
    @objc
    func gallery(){
        
    }
    
    func getSquareButton(position : Int) -> TGRelativeLayout{
        
        let bookAppt = TGRelativeLayout()
        bookAppt.tg_centerX.equal(0)
        bookAppt.tg_width.equal(UIScreen.main.bounds.width/2 - 20)
        bookAppt.tg_height.equal(120)
        //bookAppt.tg_backgroundImage = #imageLiteral(resourceName: "btn_outer")
        bookAppt.tg_top.equal(5)
        bookAppt.backgroundColor = .white
        
        let bookApptLinear = TGLinearLayout(.vert)
        bookApptLinear.tg_width.equal(UIScreen.main.bounds.width/2 - 20)
        bookApptLinear.tg_height.equal(120)
        bookApptLinear.tg_centerX.equal(0)
        
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        img.tg_centerX.equal(0)
        img.tg_top.equal(20)
        bookApptLinear.addSubview(img)
        
        let bookLabel = UILabel()
        bookLabel.tg_width.equal(.wrap)
        bookLabel.tg_height.equal(.wrap)
        
        bookLabel.tg_centerX.equal(0)
        bookLabel.tg_top.equal(4)
        bookLabel.textColor = Style.TextColor
        
        let bookBtn = FlatButton(title: "", titleColor: .white)
        bookBtn.tg_width.equal(UIScreen.main.bounds.width/2 - 20)
        bookBtn.tg_height.equal(120)
        bookBtn.tg_centerX.equal(0)
        bookApptLinear.addSubview(bookLabel)
        bookAppt.addSubview(bookApptLinear)
        bookAppt.addSubview(bookBtn)
        
        if(position == 0){
            bookLabel.text = "Doctors"
            bookAppt.tg_right.equal(5)
            img.image = #imageLiteral(resourceName: "ic_doctors")
            bookBtn.addTarget(self, action: #selector(doctors), for: .touchUpInside)
        }else if(position == 1){
            bookLabel.text = "Services"
            img.image = #imageLiteral(resourceName: "ic_services")
            bookBtn.addTarget(self, action: #selector(services), for: .touchUpInside)
        }else if(position == 2){
            bookAppt.tg_right.equal(5)
            bookLabel.text = "Facilities"
            img.image = #imageLiteral(resourceName: "ic_facilities")
            bookBtn.addTarget(self, action: #selector(facilities), for: .touchUpInside)
        }else if(position == 3){
            bookLabel.text = "Gallery"
            img.image = #imageLiteral(resourceName: "ic_gallery")
            bookBtn.addTarget(self, action: #selector(gallery), for: .touchUpInside)
        }
        return bookAppt
    }
    
    
}

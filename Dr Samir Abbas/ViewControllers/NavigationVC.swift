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
import KYDrawerController

class NavigationVC : BaseVC {
    
    var slideMenu : SlideMenuController!
    
    var page : Int! = 0;
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        let relative = TGLinearLayout(.vert)
        relative.tg_width.equal(UIScreen.main.bounds.width)
        relative.tg_height.equal(UIScreen.main.bounds.height)

        relative.addSubview(getToolbar(title: "home".localizedString, isBackMenu: false, showNotification : true))
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
        banner.tg_height.equal(Style.ScreenHeight / 4.6)
        let bannerImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Style.ScreenHeight / 4.6))
        bannerImageView.image = #imageLiteral(resourceName: "banner")
        bannerImageView.contentMode = UIViewContentMode.scaleToFill
        
        let viewPager = ViewPager()
        viewPager.tg_width.equal(UIScreen.main.bounds.width)
        viewPager.tg_height.equal(UIScreen.main.bounds.height / 4.6)
        viewPager.dataSource = self;
        banner.addSubview(viewPager)
        viewPager.pageControl.isHidden = true
        animateViewPager(viewPager: viewPager)
        //.....
        
        
        
        //BOOK APPOINTMENT...
        let bookAppt = TGRelativeLayout()
        bookAppt.tg_centerX.equal(0)
        bookAppt.tg_width.equal(UIScreen.main.bounds.width - 40)
        bookAppt.tg_height.equal(Style.ScreenHeight / 4.9)
        bookAppt.tg_backgroundImage = #imageLiteral(resourceName: "btn_outer")
        bookAppt.tg_top.equal(20)
        bookAppt.backgroundColor = .white
        
        let bookApptLinear = TGLinearLayout(.vert)
        bookApptLinear.tg_width.equal(UIScreen.main.bounds.width - 40)
        bookApptLinear.tg_height.equal(120)
        bookApptLinear.tg_centerX.equal(0)
        bookApptLinear.tg_centerY.equal(0)
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: Style.Width50, height: Style.Height65))
        img.image = #imageLiteral(resourceName: "ic_aapointment")
        img.tg_centerX.equal(0)
        img.tg_top.equal(Style.Height20)
        bookApptLinear.addSubview(img)
        
        let bookLabel = getUILabelBold(text: "book_appointment".localizedString, size: Style.TextSize20, textColor: Style.TextColor)
        bookLabel.tg_centerX.equal(0)
        bookLabel.tg_top.equal(Style.Height20)
        
        let bookBtn = FlatButton(title: "", titleColor: .white)
        bookBtn.tg_width.equal(UIScreen.main.bounds.width - 40)
        bookBtn.tg_height.equal(Style.ScreenHeight / 4.9)
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
        
        menuButton.addTarget(self, action: #selector(toggleMenu), for: .touchUpInside)
    }
    
    @objc
    func openAppointment(){
        //Opens the Booking Appointment VC...
        let book = BookAppointmentVC()
        present(book, animated: true, completion: nil)
    }
    
    @objc
    func doctors(){
        let searchDoctor = SearchDoctorVC()
        self.present(searchDoctor, animated: true, completion: nil)
    }
    
    @objc
    func services(){
        let services = ServicesListVC()
        present(services, animated: true, completion: nil)
    }
    
    @objc
    func facilities(){
        let contact = ContactUsVC()
        present(contact, animated: true, completion: nil)
    }
    
    @objc
    func gallery(){
        let gallery = GalleryVC()
        present(gallery, animated: true, completion: nil)
    }
    
    func getSquareButton(position : Int) -> TGRelativeLayout{
        
        let bookAppt = TGRelativeLayout()
        bookAppt.tg_centerX.equal(0)
        bookAppt.tg_width.equal(UIScreen.main.bounds.width/2 - 20)
        bookAppt.tg_height.equal(Style.ScreenHeight / 6.13)
        //bookAppt.tg_backgroundImage = #imageLiteral(resourceName: "btn_outer")
        bookAppt.tg_top.equal(5)
        bookAppt.backgroundColor = .white
        
        let bookApptLinear = TGLinearLayout(.vert)
        bookApptLinear.tg_width.equal(UIScreen.main.bounds.width/2 - 20)
        bookApptLinear.tg_height.equal(Style.ScreenHeight/6.13)
        bookApptLinear.tg_centerX.equal(0)
        
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: Style.Width60, height: Style.Height60))
        img.tg_centerX.equal(0)
        img.tg_top.equal(20)
        bookApptLinear.addSubview(img)
        
        let bookLabel = getUILabel(text: "", size: Style.TextSize14, textColor: Style.TextColor)
        
        bookLabel.tg_centerX.equal(0)
        bookLabel.tg_top.equal(4)
        bookLabel.textColor = Style.TextColor
        
        let bookBtn = FlatButton(title: "", titleColor: .white)
        bookBtn.tg_width.equal(UIScreen.main.bounds.width/2 - 20)
        bookBtn.tg_height.equal(Style.ScreenHeight / 6.13)
        bookBtn.tg_centerX.equal(0)
        bookApptLinear.addSubview(bookLabel)
        bookAppt.addSubview(bookApptLinear)
        bookAppt.addSubview(bookBtn)
        
        if(position == 0){
            let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: Style.TextSize16)]
            let attributedString = NSMutableAttributedString(string: "doctors".localizedString, attributes:attrs)

            bookLabel.attributedText = attributedString
            bookAppt.tg_right.equal(5)
            img.image = #imageLiteral(resourceName: "ic_doctors")
            bookBtn.addTarget(self, action: #selector(doctors), for: .touchUpInside)
        }else if(position == 1){
            let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: Style.TextSize16)]
            let attributedString = NSMutableAttributedString(string: "services".localizedString, attributes:attrs)
            bookLabel.attributedText = attributedString
            img.image = #imageLiteral(resourceName: "ic_services")
            bookBtn.addTarget(self, action: #selector(services), for: .touchUpInside)
        }else if(position == 2){
            bookAppt.tg_right.equal(5)
            let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: Style.TextSize16)]
            let attributedString = NSMutableAttributedString(string: "gallery".localizedString, attributes:attrs)
            bookLabel.attributedText = attributedString
            img.image = #imageLiteral(resourceName: "ic_gallery")
            bookBtn.addTarget(self, action: #selector(gallery), for: .touchUpInside)
        }else if(position == 3){
            let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: Style.TextSize16)]
            let attributedString = NSMutableAttributedString(string: "contact_us".localizedString, attributes:attrs)
            bookLabel.attributedText = attributedString
            img.image = #imageLiteral(resourceName: "contacticon")
            bookBtn.addTarget(self, action: #selector(facilities), for: .touchUpInside)
        }
        return bookAppt
    }
    
    func getUILabelBold(text : String, size : CGFloat, textColor : UIColor) -> UILabel{
        let label = UILabel()
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: size)]
        let attributedString = NSMutableAttributedString(string: text, attributes:attrs)
        label.tg_width.equal(.wrap)
        label.tg_height.equal(.wrap)
        label.textColor = textColor
        label.attributedText = attributedString
        return label
    }
    
    func getUILabel(text : String, size : CGFloat, textColor : UIColor) -> UILabel{
        let label = UILabel()
        let attrs = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: size)]
        let attributedString = NSMutableAttributedString(string: text, attributes:attrs)
        label.tg_width.equal(.wrap)
        label.tg_height.equal(.wrap)
        label.textColor = textColor
        label.attributedText = attributedString
        return label
    }
    
    
    
    @objc
    func toggleMenu(){
        if(slideMenu != nil){
            if(slideMenu.isLeftOpen()){
                slideMenu.closeLeft()
            }else{
                slideMenu.openLeft()
            }
        }
    }
    
    func animateViewPager(viewPager : ViewPager){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // change 2 to desired number of seconds
            // Your code with delay
            self.page = (self.page + 1) % 5;
            viewPager.scrollToPage(index: self.page)
            self.animateViewPager(viewPager: viewPager)
        }
    }
    
}



extension NavigationVC :ViewPagerDataSource{
    
    func numberOfItems(viewPager:ViewPager) -> Int {
        return 4;
    }
    
    func viewAtIndex(viewPager:ViewPager, index:Int, view:UIView?) -> UIView {
        //view = UIView();
        var newView = view;
        var label:UIImageView?
        if(newView == nil){
            newView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height / 4.6))
            
            label = UIImageView(frame: newView!.bounds)
            label?.contentMode = UIViewContentMode.scaleToFill
            if(index == 0){
                label?.image = #imageLiteral(resourceName: "banner")
            }else if(index == 1){
                label?.image = #imageLiteral(resourceName: "banner1")
            }else if(index == 2){
                label?.image = #imageLiteral(resourceName: "banner2")
            }else if(index == 3){
                label?.image = #imageLiteral(resourceName: "banner4")
            }
            
            //label!.font =  label!.font.withSizewithSize(28)
            newView?.addSubview(label!)
        }else{
            label = newView?.viewWithTag(1) as? UIImageView
        }
        
        //label?.text = "Page View Pager  \(index+1)"
        
        return newView!
    }
}

func didSelectedItem(index: Int) {
    print("select index \(index)")
}

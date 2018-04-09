//
//  TimeSlotVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 08/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import TangramKit
import Material


class TimeSlotVC : BaseVC {
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        let relative = TGLinearLayout(.vert)
        relative.tg_width.equal(UIScreen.main.bounds.width)
        relative.tg_height.equal(UIScreen.main.bounds.height)
        
        relative.addSubview(getToolbar(title: "Select a time slot", isBackMenu: true, addSpinner : false))
        view.addSubview(relative)
        relative.backgroundColor = Style.BackgroundColor
        
        menuButton.addTarget(self, action: #selector(onBackPressed), for: .touchUpInside)
        
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
        
        relative.addSubview(strip)
        
        //Doctors Info...
        let doctorLayout = TGLinearLayout(.horz)
        doctorLayout.tg_width.equal(UIScreen.main.bounds.width)
        doctorLayout.tg_height.equal(90)
        doctorLayout.backgroundColor = .white
        doctorLayout.tg_top.equal(30)
        
        //DOCTOR IMAGE VIEW...
        let image2 = UIImage(named: "blank_profile.png")
        
        let profile = UIImageView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        profile.image = image2
        profile.contentMode = UIViewContentMode.scaleAspectFill
        //....
        
        //Left view...
        let leftLinear = TGLinearLayout(.vert)
        leftLinear.tg_width.equal(.wrap)
        leftLinear.tg_height.equal(.wrap)
        leftLinear.addSubview(profile)
        leftLinear.tg_centerY.equal(0)
        leftLinear.addSubview(getUILabel(text: "MBBS", size: 18, textColor: Style.TextColor))
        leftLinear.tg_left.equal(30)
        doctorLayout.addSubview(leftLinear)
        //....
        
        //Doctor Info....
        let rightLinear = TGLinearLayout(.vert)
        rightLinear.tg_width.equal(UIScreen.main.bounds.width - 90)
        rightLinear.tg_height.equal(.wrap)
        rightLinear.tg_centerY.equal(0)
        rightLinear.addSubview(getUILabel(text: "Dr. Ayunshman Gupta", size: 18, textColor: Style.TextColor))
        rightLinear.addSubview(getUILabel(text: "Dentist", size: 18, textColor: Style.TextColor))
        rightLinear.addSubview(getUILabel(text: "Available Today", size: 16, textColor: Style.AccentColor))
        rightLinear.tg_left.equal(20)
        doctorLayout.addSubview(rightLinear)
        //...

        relative.addSubview(doctorLayout)

        
        
        //===============DAY SELECTOR===========
        let dayHolder = TGLinearLayout(.vert)
        dayHolder.tg_width.equal(UIScreen.main.bounds.width - 40)
        dayHolder.tg_height.equal(125)
        dayHolder.tg_top.equal(20)
        dayHolder.tg_backgroundImage = #imageLiteral(resourceName: "cal_background")
        dayHolder.tg_centerX.equal(0)
        let weekSchedule = getUILabel(text: "Weekly Schedule", size: 18, textColor: Style.TextColor)
        weekSchedule.tg_centerX.equal(0)
        weekSchedule.tg_top.equal(8)
        dayHolder.addSubview(weekSchedule)
        
        //Calendar Image setup
        var image3 = UIImage(named: "ic_calender.png")
        let calImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        calImage.image = image3
        calImage.contentMode = UIViewContentMode.scaleAspectFill
        calImage.tg_right.equal(10)
        let calLayout = TGLinearLayout(.horz)
        calLayout.tg_width.equal(.wrap)
        calLayout.tg_height.equal(.wrap)
        calLayout.tg_centerX.equal(0)
        calLayout.tg_top.equal(8)
        calLayout.addSubview(calImage)
        calLayout.addSubview(getUILabel(text: "MARCH", size: 16, textColor: UIColor.blue))
        dayHolder.addSubview(calLayout)
        //......
        
        //Day selector setup...
        let daysLayout = TGLinearLayout(.horz)
        daysLayout.tg_width.equal(UIScreen.main.bounds.width - 50)
        daysLayout.tg_height.equal(.wrap)
        daysLayout.tg_centerX.equal(0)
        daysLayout.tg_left.equal(10)
        daysLayout.tg_right.equal(10)
        daysLayout.tg_top.equal(5)
        
        //Left swipe button
        let leftSwipe = IconButton(image: getUIImage(image: "left_swipe.png", resizeX: 8, resizeY: 8), tintColor: Style.Transparent)
        leftSwipe.tg_width.equal(.wrap)
        leftSwipe.tg_height.equal(.wrap)
        daysLayout.addSubview(leftSwipe)
        let data = CalendarDate()
        daysLayout.addSubview(addNearbyVehiclesList(calendarDate: data))
        
        
        //Right swipe button
        
        
        
        dayHolder.addSubview(daysLayout)
        //
        
        relative.addSubview(dayHolder)
        
        
    }
    
    @objc
    func onBackPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func getUIImage(image : String, resizeX : CGFloat, resizeY : CGFloat) -> UIImage{
        var left = UIImage(named: image)
        left = left?.resize(toHeight: resizeX)
        left = left?.resize(toWidth: resizeY)
        return left!
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
    
    func getUIImageView(sizeX : Int, sizeY : Int) -> UIImageView{
        let image = UIImageView()
        image.tg_width.equal(sizeX)
        image.tg_height.equal(sizeY)
        image.tg_centerX.equal(0)
        image.tg_centerY.equal(0)
        return image
    }
    
    func addNearbyVehiclesList(calendarDate : CalendarDate) -> ASHorizontalScrollView{
        
        let horizontalScrollView:ASHorizontalScrollView = ASHorizontalScrollView(frame:CGRect(x: 0, y: 0, width: view.frame.size.width, height: 52))
        horizontalScrollView.marginSettings_320 = MarginSettings(leftMargin: 5, miniMarginBetweenItems: 1, miniAppearWidthOfLastItem: 20)
        horizontalScrollView.marginSettings_480 = MarginSettings(leftMargin: 5, miniMarginBetweenItems: 1, miniAppearWidthOfLastItem: 20)
        horizontalScrollView.marginSettings_414 = MarginSettings(leftMargin: 5, miniMarginBetweenItems: 1, miniAppearWidthOfLastItem: 20)
        horizontalScrollView.marginSettings_736 = MarginSettings(leftMargin: 5, miniMarginBetweenItems: 2, miniAppearWidthOfLastItem: 30)
        horizontalScrollView.defaultMarginSettings = MarginSettings(leftMargin: 5, miniMarginBetweenItems: 2, miniAppearWidthOfLastItem: 20)
        horizontalScrollView.uniformItemSize = CGSize(width: 120, height: 52)
        //horizontalScrollView.setItemsMarginOnce()
        
        
        
        for index in 0...30{
            horizontalScrollView.addItem(getVehicleCell(data : calendarDate, tag : index))
        }
        return horizontalScrollView;
    }
    
    func getVehicleCell(data : CalendarDate, tag : Int) -> UIView{
        let btn = getFlatButton(width : 120, height : 40) ;
        let relativeLayout = TGRelativeLayout();
        relativeLayout.tg_width.equal(120) ;
        relativeLayout.tg_height.equal(40) ;
        //let logo = getVehicleImage(image: data.code) ;
        let name: UILabel = getUILabel(text: data.day, size: 12, textColor: Style.TextColor) ;
        
        let linearLayout = TGLinearLayout(.horz) ;
        linearLayout.tg_width.equal(120) ;
        linearLayout.tg_height.equal(40) ;
        //linearLayout.addSubview(logo) ;
        linearLayout.addSubview(name) ;
        
        relativeLayout.addSubview(getRaisedButton(width : 120, height : 40))
        relativeLayout.addSubview(linearLayout)
        relativeLayout.addSubview(btn) ;
        btn.tag = tag
        btn.addTarget(self, action: #selector(self.calItemClick(sender:)), for: .touchUpInside)
        relativeLayout.tg_centerY.equal(0)
        relativeLayout.tg_centerX.equal(0)
        
        let uiView = UIView()
        uiView.tg_width.equal(120)
        uiView.tg_height.equal(40)
        uiView.addSubview(relativeLayout)
        return uiView;
    }
    
    //Returns the flat button with specified width and height...
    func getFlatButton(width : Int , height : Int) -> FlatButton{
        let btn = FlatButton(title : "",  titleColor : .white)
        btn.pulseColor = Style.TextColor ;
        btn.cornerRadiusPreset = CornerRadiusPreset.cornerRadius3
        btn.tg_width.equal(width - 10)
        btn.tg_height.equal(height)
        btn.tg_centerX.equal(0)
        btn.titleLabel?.textAlignment = .left
        return btn ;
    }
    
    @objc
    func calItemClick(sender: UIButton){
        
    }
    
    //Returns the raised button with specified width and height...
    func getRaisedButton(width : Int, height : Int) -> RaisedButton{
        let btn = RaisedButton(title : "",  titleColor : .white)
        btn.pulseColor = .white ;
        btn.cornerRadiusPreset = CornerRadiusPreset.cornerRadius3
        btn.tg_width.equal(width - 10)
        btn.tg_centerX.equal(0)
        btn.tg_height.equal(height)
        btn.titleLabel?.textAlignment = .left
        return btn ;
    }
}

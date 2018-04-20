//
//  PatientDetailsVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 20/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import Material
import TangramKit

class PatientDetailsVC : BaseVC {
    
    var doctor : Doctor!
    var specilization : String!
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        let linear = TGLinearLayout(.vert)
        linear.tg_width.equal(UIScreen.main.bounds.width)
        linear.tg_height.equal(.wrap)
        linear.backgroundColor = Style.BackgroundColor
        linear.addSubview(getToolbar(title: "Patient Details", isBackMenu: true, addSpinner : false))
        var image = UIImage(named: "strip.png")
        image = image?.resize(toHeight: 3)
        image = image?.resize(toWidth: UIScreen.main.bounds.width)
        
        let strip = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 3))
        strip.image = image
        strip.contentMode = UIViewContentMode.scaleAspectFill
        strip.tg_top.equal(8)
        //....
        linear.addSubview(strip)
        
        //Doctors Info...
        let doctorLayout = TGLinearLayout(.horz)
        doctorLayout.tg_width.equal(UIScreen.main.bounds.width)
        doctorLayout.tg_height.equal(Style.Height90)
        doctorLayout.backgroundColor = .white
        doctorLayout.tg_top.equal(30)
        
        //DOCTOR IMAGE VIEW...
        let image2 = UIImage(named: "blank_profile.png")
        
        let profile = UIImageView(frame: CGRect(x: 0, y: 0, width: Style.Width45, height: Style.Height45))
        profile.image = image2
        profile.contentMode = UIViewContentMode.scaleAspectFill
        //....
        
        //Left view...
        let leftLinear = TGLinearLayout(.vert)
        leftLinear.tg_width.equal(.wrap)
        leftLinear.tg_height.equal(.wrap)
        leftLinear.addSubview(profile)
        leftLinear.tg_centerY.equal(0)
        leftLinear.addSubview(getUILabel(text: doctor.degree, size: 18, textColor: Style.TextColor))
        leftLinear.tg_left.equal(Style.Height30)
        doctorLayout.addSubview(leftLinear)
        //....
        
        //Doctor Info....
        let rightLinear = TGLinearLayout(.vert)
        rightLinear.tg_width.equal(UIScreen.main.bounds.width - Style.Width80)
        rightLinear.tg_height.equal(.wrap)
        rightLinear.tg_centerY.equal(0)
        var drName = "Dr "
        drName.append(doctor.name)
        rightLinear.addSubview(getUILabel(text: drName, size: 18, textColor: Style.TextColor))
        rightLinear.addSubview(getUILabel(text: specilization, size: 18, textColor: Style.TextColor))
        let available = getUILabel(text: "Available Today", size: 16, textColor: Style.AccentColor)
        rightLinear.addSubview(available)
        
        if(doctor.isAvailableToday == false){
            available.isHidden = true
        }
        
        rightLinear.tg_left.equal(20)
        doctorLayout.addSubview(rightLinear)
        //...
        
        linear.addSubview(doctorLayout)

        view.addSubview(linear)
        
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
}

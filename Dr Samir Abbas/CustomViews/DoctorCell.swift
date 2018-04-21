//
//  DoctorCell.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 13/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import UIKit
import TangramKit
import Material

class DoctorCell : UITableViewCell {
    
    var docImage : UIImageView!
    var qualification : UILabel!
    var name : UILabel!
    var specialization : UILabel!
    var experience : UILabel!
    var available: UILabel!
    var book : FlatButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Doctors Info...
        let doctorLayout = TGRelativeLayout()
        doctorLayout.tg_width.equal(UIScreen.main.bounds.width)
        doctorLayout.tg_height.equal(Style.Height110)
        doctorLayout.backgroundColor = .white
        
        //DOCTOR IMAGE VIEW...
        let image2 = UIImage(named: "blank_profile.png")
        
        docImage = UIImageView(frame: CGRect(x: 0, y: 0, width: Style.Height45, height: Style.Height45))
        docImage.image = image2
        docImage.contentMode = UIViewContentMode.scaleAspectFill
        //....
        
        //Left view...
        let leftLinear = TGLinearLayout(.vert)
        leftLinear.tg_width.equal(.wrap)
        leftLinear.tg_height.equal(.wrap)
        leftLinear.addSubview(docImage)
        leftLinear.tg_centerY.equal(0)
        qualification = getUILabel(text: "MBBS", size: Style.TextSize18, textColor: Style.TextColor)
        leftLinear.addSubview(qualification)
        leftLinear.tg_left.equal(Style.Height30)
        doctorLayout.addSubview(leftLinear)
        //....
        
        //Doctor Info....
        let rightLinear = TGLinearLayout(.vert)
        rightLinear.tg_width.equal(UIScreen.main.bounds.width - Style.Width80)
        rightLinear.tg_left.equal(Style.Height45 + Style.Height30 + 20)
        rightLinear.tg_height.equal(.wrap)
        rightLinear.tg_centerY.equal(0)
        name = getUILabel(text: "Dr. Ayunshman Gupta", size: Style.TextSize18, textColor: Style.TextColor)
        rightLinear.addSubview(name)
        
        specialization = getUILabel(text: "Dentist", size: Style.TextSize14, textColor: Style.TextColor)
        specialization.tg_top.equal(5)
        rightLinear.addSubview(specialization)
        
        experience = getUILabel(text: "12 years experience", size: Style.TextSize14, textColor: Style.TextColor)
        experience.tg_top.equal(5)
        rightLinear.addSubview(experience)
        //rightLinear.tg_left.equal(20)
        doctorLayout.addSubview(rightLinear)
        //...
        contentView.backgroundColor = Style.BackgroundColor
        
        let extRightLinear = TGLinearLayout(.vert)
        extRightLinear.tg_width.equal(.wrap)
        extRightLinear.tg_height.equal(.wrap)
        extRightLinear.tg_centerY.equal(0)
        extRightLinear.tg_left.equal(UIScreen.main.bounds.width - Style.Width80 - Style.Width45 + 20)
        book = FlatButton(title: "", titleColor: .white)
        book.tg_width.equal(Style.Width80)
        
        
        
        let btnLayout = TGRelativeLayout()
        btnLayout.tg_width.equal(.wrap)
        btnLayout.tg_height.equal(.wrap)
        btnLayout.tg_centerX.equal(0)
        btnLayout.addSubview(book)
        
        let btnLabel = getUILabel(text: "BOOK", size: Style.TextSize16, textColor: .white)
        btnLabel.tg_centerX.equal(0)
        btnLabel.tg_centerY.equal(0)
        btnLayout.addSubview(btnLabel)
        
        book.tg_height.equal(.wrap)
        book.backgroundColor = UIColor().HexToColor(hexString: "#3c7fd0")
        extRightLinear.addSubview(btnLayout)
        available = getUILabel(text: "Available Today", size: Style.TextSize14, textColor: Style.AccentColor)
        available.tg_top.equal(5)
        extRightLinear.addSubview(available)
        doctorLayout.addSubview(extRightLinear)
        contentView.addSubview(doctorLayout)
        
    }
    
    func getUILabel(text : String, size : CGFloat, textColor : UIColor) -> UILabel{
        let label = UILabel()
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: size)]
        let attributedString = NSMutableAttributedString(string: text, attributes:attrs)
        label.tg_width.equal(.wrap)
        label.tg_height.equal(.wrap)
        label.textColor = textColor
        label.attributedText = attributedString
        return label
    }
}

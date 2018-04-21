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
    var slot : SlotData!
    
    var name : TextField!
    var number : TextField!
    var nid : TextField!
    var ins : TextField!
    
    var selectedDate : String!
    
    var fields = ["Name", "Mobile No", "National Id/QMA", "Insurance Number"]
    var images = [#imageLiteral(resourceName: "patient_name"), #imageLiteral(resourceName: "mobile"), #imageLiteral(resourceName: "national_id"), #imageLiteral(resourceName: "insurance_no")]
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        let linear = TGLinearLayout(.vert)
        linear.tg_width.equal(UIScreen.main.bounds.width)
        linear.tg_height.equal(UIScreen.main.bounds.height)
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
        let url = URL(string: doctor.profilePictureURL)
        profile.kf.setImage(with: url)
        //....
        
        //Left view...
        let leftLinear = TGLinearLayout(.vert)
        leftLinear.tg_width.equal(.wrap)
        leftLinear.tg_height.equal(.wrap)
        leftLinear.addSubview(profile)
        leftLinear.tg_centerY.equal(0)
        leftLinear.addSubview(getUILabel(text: doctor.degree, size: Style.TextSize18, textColor: Style.TextColor))
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
        rightLinear.addSubview(getUILabel(text: drName, size: Style.TextSize18, textColor: Style.TextColor))
        rightLinear.addSubview(getUILabel(text: specilization, size: Style.TextSize18, textColor: Style.TextColor))
        let available = getUILabel(text: "Available Today", size: Style.TextSize16, textColor: Style.AccentColor)
        rightLinear.addSubview(available)
        
        if(doctor.isAvailableToday == false){
            available.isHidden = true
        }
        
        rightLinear.tg_left.equal(20)
        doctorLayout.addSubview(rightLinear)
        //...
        
        linear.addSubview(doctorLayout)
        
        let nameLayout = TGLinearLayout(.vert)
        nameLayout.tg_width.equal(Style.ScreenWidth - 40)
        nameLayout.tg_height.equal(.wrap)
        
        nameLayout.addSubview(getUIImageView(sizeX: 5, sizeY: 10))

        var heading = getUILabel(text: "ENTER PATIENT DETAILS", size: Style.TextSize18, textColor: Style.AccentColor)
        heading.tg_centerX.equal(0)
        nameLayout.addSubview(heading)
        
        //name = getEditText(position: 0)
        nameLayout.addSubview(getUIImageView(sizeX: 5, sizeY: 15))

        nameLayout.addSubview(getEditText(position: 0))
        nameLayout.addSubview(getUIImageView(sizeX: 5, sizeY: 15))
        //number = getEditText(position: 1)
        nameLayout.addSubview(getEditText(position: 1))
        nameLayout.addSubview(getUIImageView(sizeX: 5, sizeY: 15))

        //nid = getEditText(position: 2)
        nameLayout.addSubview(getEditText(position: 2))
        nameLayout.addSubview(getUIImageView(sizeX: 5, sizeY: 15))

        //ins = getEditText(position: 3)
        nameLayout.addSubview(getEditText(position: 3))
        nameLayout.addSubview(getUIImageView(sizeX: 5, sizeY: 25))

        
        nameLayout.tg_centerX.equal(0)
        
        linear.addSubview(nameLayout)
        
        nameLayout.tg_top.equal(Style.Height20)
        nameLayout.backgroundColor = .white
        
        
        
        view.addSubview(linear)
        
        let nextBtn = nextButton()
        nextBtn.tg_centerX.equal(0)
        nextBtn.tg_top.equal(Style.ScreenHeight - Style.Height48)
        view.addSubview(nextBtn)
        menuButton.addTarget(self, action: #selector(onBackPressed), for: .touchUpInside)
        view.backgroundColor = Style.BackgroundColor
        
    }
    
    func getEditText(position : Int)->TGLinearLayout{
        let name = TextField()
        name.tg_width.equal(Style.ScreenWidth - Style.Width90)
        name.tg_height.equal(Style.Height30 + 5)
        name.placeholder = fields[position]
        name.detail = ""
        name.isClearIconButtonEnabled = true
        name.isPlaceholderUppercasedWhenEditing = true
        name.placeholderAnimation = .hidden
        name.tg_centerX.equal(0)
        
        let main = TGLinearLayout(.horz)
        main.tg_width.equal(Style.ScreenWidth - 60)
        main.tg_height.equal(Style.Height30 + 5)
        main.addSubview(getFrontIcon(position: position))
        main.addSubview(name)
        if(position == 0){
            self.name = name
        }else if(position == 1){
            self.number = name
        }else if(position == 2){
            self.nid = name
        }else if(position == 3){
            self.ins = name
        }
        return main
    }
    
    func getFrontIcon(position : Int)->TGRelativeLayout{
        let main = TGRelativeLayout()
        main.tg_width.equal(Style.Height30 + 5)
        main.tg_height.equal(Style.Height30 + 5)
        
        let img = getUIImageView(sizeX: Int(Style.Height25), sizeY: Int(Style.Height25))
        img.tg_centerX.equal(0)
        img.tg_centerY.equal(0)
        //main.addSubview(main)
        img.image = images[position]
        main.addSubview(img)
        return main
    }
    
    @objc
    func onBackPressed(){
        self.dismiss(animated: true, completion: nil)
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
    
    func getUIImageView(sizeX : Int, sizeY : Int) -> UIImageView{
        let image = UIImageView()
        image.tg_width.equal(sizeX)
        image.tg_height.equal(sizeY)
        image.tg_centerX.equal(0)
        image.tg_centerY.equal(0)
        return image
    }
    
    
    
    func nextButton()->TGRelativeLayout{
        let main = TGRelativeLayout()
        let flat = RaisedButton(title: "", titleColor: .white)
        flat.tg_width.equal(Style.Width80)
        flat.tg_height.equal(Style.Height30)
        
        let text = getUILabel(text: "NEXT", size: Style.TextSize18, textColor: Style.AccentColor)
        text.tg_centerX.equal(0)
        text.tg_centerY.equal(0)
        
        main.tg_width.equal(.wrap)
        main.tg_height.equal(.wrap)
        flat.addTarget(self, action: #selector(self.nextClick), for: .touchUpInside)
        main.addSubview(flat)
        main.tg_topBorderline = TGBorderline.init(color: Style.AccentColor, thick: 5, dash: 0, headIndent: 0, tailIndent: 0, offset: 0)
        main.tg_bottomBorderline = TGBorderline.init(color: Style.AccentColor, thick: 5, dash: 0, headIndent: 0, tailIndent: 0, offset: 0)
        main.tg_leftBorderline = TGBorderline.init(color: Style.AccentColor, thick: 5, dash: 0, headIndent: 0, tailIndent: 0, offset: 0)
        main.tg_rightBorderline = TGBorderline.init(color: Style.AccentColor, thick: 5, dash: 0, headIndent: 0, tailIndent: 0, offset: 0)
        //main.borderWidthPreset = TGBorderline.init(color: UIColorStyle.AccentColor, thick: 5, dash: 0, headIndent: 0, tailIndent: 0, offset: 0)
        main.addSubview(text)
        return main
    }
    
    @objc
    func nextClick(){
        if(name.text?.characters.count == 0){
            self.view.makeToast("Enter name")
            return
        }
        
        if(number.text?.characters.count == 0){
            self.view.makeToast("Enter number")
            return
        }
        
        if(nid.text?.characters.count == 0){
            self.view.makeToast("Enter National Id")
            return
        }
        
        if(ins.text?.characters.count == 0){
            self.view.makeToast("Enter insurance number")
            return
        }
        
        let vc = SummaryVC()
        vc.doctor = doctor
        vc.specilization = specilization
        vc.selectedTime = slot.getProperTime()
        vc.selectedDate = selectedDate
        vc.name = name.text
        vc.no = number.text
        vc.nid = nid.text
        vc.ins = ins.text
        vc.slot = slot
        present(vc, animated: true, completion: nil)
        
    }
}

//
//  SummaryVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 21/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import Material
import TangramKit
import Alamofire
import Toast_Swift

class SummaryVC : BaseVC{
    
    var doctor : Doctor!
    var specilization : String!
    var selectedDate : String!
    var selectedTime : String!
    var slot : SlotData!
    var name: String!
    var no : String!
    var nid : String!
    var ins : String!
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        let linear = TGLinearLayout(.vert)
        linear.tg_width.equal(UIScreen.main.bounds.width)
        linear.tg_height.equal(UIScreen.main.bounds.height)
        linear.backgroundColor = Style.BackgroundColor
        linear.addSubview(getToolbar(title: "Summary", isBackMenu: true, addSpinner : false))
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
        doctorLayout.tg_top.equal(20)
        
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
        
        let wrapper = TGLinearLayout(.vert)
        wrapper.tg_width.equal(Style.ScreenWidth)
        wrapper.tg_height.equal(Style.Height80)
        wrapper.backgroundColor = .white
        wrapper.tg_top.equal(10)
        
        
        let slotInfo = TGLinearLayout(.horz)
        slotInfo.tg_width.equal(Style.ScreenWidth - Style.Width80 + 3)
        slotInfo.tg_height.equal(Style.Height80 - 15)
        
        let left = TGLinearLayout(.vert)
        left.tg_width.equal((Style.ScreenWidth - Style.Width80) / 2)
        left.tg_height.equal(Style.Height60)
        left.tg_centerX.equal(0)
        left.tg_centerY.equal(0)
        let datHead = getUILabel(text: "Date", size: Style.TextSize16, textColor: Style.AccentColor)
        datHead.tg_centerX.equal(0)
        left.addSubview(datHead)
        let dat = getUILabel(text: selectedDate, size: Style.TextSize16, textColor: .black)
        dat.tg_centerX.equal(0)

        dat.tg_top.equal(10)
        left.addSubview(dat)
        left.tg_centerY.equal(0)
        
        
        let right = TGLinearLayout(.vert)
        right.tg_width.equal((Style.ScreenWidth - Style.Width80) / 2)
        right.tg_height.equal(Style.Height60)
        right.tg_centerX.equal(0)
        right.tg_centerY.equal(0)
        let datHead2 = getUILabel(text: "Time", size: Style.TextSize16, textColor: Style.AccentColor)
        datHead2.tg_centerX.equal(0)
        right.addSubview(datHead2)
        let dat2 = getUILabel(text: selectedTime, size: Style.TextSize16, textColor: .black)
        dat2.tg_centerX.equal(0)
        
        dat2.tg_top.equal(10)
        right.addSubview(dat2)
        
        
        right.tg_centerY.equal(0)
        slotInfo.addSubview(left)
        
        let separator = getUIImageView(sizeX: 1, sizeY: Int(Style.Height60))
        separator.backgroundColor = Style.TextColor
        slotInfo.addSubview(separator)
        
        slotInfo.addSubview(right)
        slotInfo.backgroundColor = Style.BackgroundColor
        slotInfo.tg_centerX.equal(0)
        slotInfo.tg_centerY.equal(0)
        wrapper.addSubview(slotInfo)
        slotInfo.tg_top.equal(15 / 2)
        
        slotInfo.tg_topBorderline = TGBorderline.init(color: Style.TextColor)
        slotInfo.tg_bottomBorderline = TGBorderline.init(color: Style.TextColor)
        slotInfo.tg_leftBorderline = TGBorderline.init(color: Style.TextColor)
        slotInfo.tg_rightBorderline = TGBorderline.init(color: Style.TextColor)

        
        linear.addSubview(wrapper)
        
        linear.addSubview(getUIImageView(sizeX: 5, sizeY: 10))
        
        linear.addSubview(getUILabel(text: "NAME", size: Style.TextSize16, textColor: Style.AccentColor, backGroundColor: .white))
        linear.addSubview(getUILabel(text: name, size: Style.TextSize16, textColor: UIColor().HexToColor(hexString: "#3c7fd1"), backGroundColor: Style.BackgroundColor))
        linear.addSubview(getUILabel(text: "MOBILE NUMBER", size: Style.TextSize16, textColor: Style.AccentColor, backGroundColor: .white))
        linear.addSubview(getUILabel(text: no, size: Style.TextSize16, textColor: UIColor().HexToColor(hexString: "#3c7fd1"), backGroundColor: Style.BackgroundColor))
        linear.addSubview(getUILabel(text: "National Id/QMA", size: Style.TextSize16, textColor: Style.AccentColor, backGroundColor: .white))
        linear.addSubview(getUILabel(text: nid, size: Style.TextSize16, textColor: UIColor().HexToColor(hexString: "#3c7fd1"), backGroundColor: Style.BackgroundColor))
        linear.addSubview(getUILabel(text: "Inurance Number", size: Style.TextSize16, textColor: Style.AccentColor, backGroundColor: .white))
        linear.addSubview(getUILabel(text: ins, size: Style.TextSize16, textColor: UIColor().HexToColor(hexString: "#3c7fd1"), backGroundColor: Style.BackgroundColor))

        
        menuButton.addTarget(self, action: #selector(onBackPressed), for: .touchUpInside)
        view.backgroundColor = Style.BackgroundColor
        view.addSubview(linear)
        
        let nextBtn = nextButton()
        nextBtn.tg_centerX.equal(0)
        nextBtn.tg_top.equal(Style.ScreenHeight - Style.Height48)
        view.addSubview(nextBtn)
    }
    
    
    
    func nextButton()->TGRelativeLayout{
        let main = TGRelativeLayout()
        let flat = RaisedButton(title: "", titleColor: .white)
        flat.tg_width.equal(Style.Width80 + Style.Width30)
        flat.tg_height.equal(Style.Height30)
        
        let text = getUILabel(text: "CONFIRM", size: Style.TextSize18, textColor: Style.AccentColor)
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
        print("HERE")
        confirm()
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
    
    func getUILabel(text : String, size : CGFloat, textColor : UIColor, backGroundColor : UIColor) -> UILabel{
        let label = UILabel()
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: size)]
        let attributedString = NSMutableAttributedString(string: text, attributes:attrs)
        label.tg_width.equal(Style.ScreenWidth)
        label.sizeToFit()
        label.tg_centerX.equal(0)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.backgroundColor = backGroundColor
        label.tg_height.equal(Style.Height30)
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
    
    func confirm(){
        var url = "http://www.bhavikagarwal.com/"
        url.append("booking/apis/book_doctor")
        let dialogBox = ConstructDialog.ConstructProgressDialog(dialogTitle: "Booking Appointment...", dialogMessage: "Please wait white we are booking you appointment...")
        present(dialogBox, animated: true, completion: nil)
        print(url)
        let parameters: Parameters = ["slot_id": slot.id, "name":name, "national_id": nid, "insurance_no": ins, "mobile" : no] ;
        
        Alamofire.request(url, method: .post ,parameters : parameters, encoding: JSONEncoding.default ).responseJSON {response in
            print(response)
            if(response.result != nil){
                if(response.result.value != nil){
                    let responseJSON = response.result.value as! [String:AnyObject]
                    let decoder = JSONDecoder()
                    let success = responseJSON["success"] as! Int
                    if(success == 1){
                        var data = responseJSON["data"] as! [String : AnyObject]
                        var id = data["booking_id"] as! String
                        let confirm = ConfirmationVC()
                        confirm.id = id
                        dialogBox.dismiss(animated: true, completion: {
                            self.present(confirm, animated: true, completion: nil)
                            })
                        
                    }else{
                        self.view.makeToast("Failed to book appointment, try again")
                        dialogBox.dismiss(animated: true, completion: nil)
                    }
                }else{
                    //Failed...
                    self.view.makeToast("Failed to book appointment, try again")
                    dialogBox.dismiss(animated: true, completion: nil)
                }
            }else{
                //Failed...
                self.view.makeToast("Failed to book appointment, try again")
                dialogBox.dismiss(animated: true, completion: nil)
            }
        }

    
    }
}

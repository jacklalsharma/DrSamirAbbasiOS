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
import Alamofire
import Toast_Swift

class TimeSlotVC : BaseVC{
    
    var specilization : String!
    var doctor : Doctor!
    var dates = [CalendarDate]()
    var btns = [RaisedButton]()
    var texts = [UILabel]()
    var slotButtons = [RaisedButton]()
    var slotTexts = [UILabel]()
    
    var list : UITableView!
    
    var slots : BookingSlot!
    
    
    var images = [#imageLiteral(resourceName: "ic_morning"), #imageLiteral(resourceName: "ic_afternoon"), #imageLiteral(resourceName: "ic_evening"), #imageLiteral(resourceName: "ic_night")]
    var headings = ["Morning", "Afternoon" , "Evening" , "Night"]
    
    var linear : TGLinearLayout!
    var scroll : RelativeLayout!
    
    var sessionHeight : CGFloat!
    
    var fetched : Bool!
    
    var btnPosition : Int!
    
    var selectedSlot : SlotData!
    var allSlots = [SlotData]()
    var selectedDate : String!
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        btnPosition = -1
        fetched = false
        constructUI()
    }
    
    func constructUI(){
        sessionHeight = 0;
        
        linear = TGLinearLayout(.vert)
        linear.tg_width.equal(UIScreen.main.bounds.width)
        linear.tg_height.equal(.wrap)
        linear.backgroundColor = Style.BackgroundColor
        linear.addSubview(getToolbar(title: "Select a time slot", isBackMenu: true, addSpinner : false))
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
        doctorLayout.tg_top.equal(Style.Height80)
        
        
        
        
        
        //===============DAY SELECTOR===========
        let dayHolder = TGLinearLayout(.vert)
        dayHolder.tg_width.equal(UIScreen.main.bounds.width - Style.Width30)
        dayHolder.tg_height.equal(Style.Height120 + Style.Height20)
        dayHolder.tg_top.equal(20)
        dayHolder.tg_backgroundImage = #imageLiteral(resourceName: "cal_background")
        dayHolder.tg_centerX.equal(0)
        let weekSchedule = getUILabel(text: "Schedule", size: Style.TextSize18, textColor: UIColor().HexToColor(hexString: "#ff640f"))
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
        
        var date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        calLayout.addSubview(getUILabel(text: date.getMonthName().uppercased(), size: Style.TextSize16, textColor: UIColor().HexToColor(hexString: "#3c7fd1")))
        dayHolder.addSubview(calLayout)
        //......
        
        //Day selector setup...
        let daysLayout = TGLinearLayout(.horz)
        daysLayout.tg_width.equal(UIScreen.main.bounds.width - Style.Width45)
        daysLayout.tg_height.equal(.wrap)
        daysLayout.tg_centerX.equal(0)
        daysLayout.tg_left.equal(10)
        daysLayout.tg_right.equal(10)
        daysLayout.tg_top.equal(5)
        
        //Left swipe button
        let leftSwipe = IconButton(image: getUIImage(image: "left_swipe.png", resizeX: 8, resizeY: 8), tintColor: Style.Transparent)
        leftSwipe.tg_width.equal(.wrap)
        leftSwipe.tg_height.equal(.wrap)
        leftSwipe.tg_centerY.equal(0)
        daysLayout.addSubview(leftSwipe)
        
        //Calendar buttons...
        let data = CalendarDate()
        daysLayout.addSubview(addNearbyVehiclesList(calendarDate: data))
        
        
        
        //Right swipe button
        let rightSwipe = IconButton(image: getUIImage(image: "right_swipe.png", resizeX: 8, resizeY: 8), tintColor: Style.Transparent)
        rightSwipe.tg_width.equal(.wrap)
        rightSwipe.tg_height.equal(.wrap)
        rightSwipe.tg_centerY.equal(0)
        daysLayout.addSubview(rightSwipe)
        //daysLayout.tg_bottom.equal(20)
        
        dayHolder.addSubview(daysLayout)
        dayHolder.tg_top.equal(Style.Height80 + Style.Height100)
        let today = getUILabel(text: "Today", size: Style.TextSize16, textColor: UIColor().HexToColor(hexString: "#3c7fd1"))
        today.tg_left.equal(Style.Width20)
        dayHolder.addSubview(today)
        
        
        
        
        let sessionsLayout = TGLinearLayout(.vert)
        sessionsLayout.tg_width.equal(Style.ScreenWidth - Style.Width30)
        sessionsLayout.tg_height.equal(.wrap)
        sessionsLayout.tg_centerX.equal(0)
        sessionsLayout.tg_left.equal(Style.Width30 / 2)
        sessionsLayout.backgroundColor = .white
        
        let s0 = getSessionSlot(position: 0)
        s0.tg_centerX.equal(0)
        s0.tg_left.equal(Style.Width45)
        s0.tg_top.equal(15)
        sessionsLayout.addSubview(s0)
        
        let s1 = getSessionSlot(position: 1);
        s1.tg_centerX.equal(0)
        s1.tg_left.equal(Style.Width45)
        s1.tg_top.equal(15)
        sessionsLayout.addSubview(s1)

        
        let s2 = getSessionSlot(position: 2);
        s2.tg_centerX.equal(0)
        s2.tg_left.equal(Style.Width45)
        s2.tg_top.equal(15)
        sessionsLayout.addSubview(s2)
        
        
        let s3 = getSessionSlot(position: 3);
        s3.tg_centerX.equal(0)
        s3.tg_left.equal(Style.Width45)
        s3.tg_top.equal(15)
        sessionsLayout.addSubview(s3)
        
        
        sessionsLayout.tg_centerX.equal(0)
        sessionsLayout.backgroundColor = .white
        
        sessionsLayout.tg_top.equal(Style.Height80 + Style.Height90 + Style.Height110 + Style.Height50)
        
        
        var ll = LinearLayout(width: MATCH_PARENT, height: Style.ScreenHeight * 1.5).vertical()
        ll.padding(left: 0, right: 0, top: 0, bottom: 0)
        ll.add(view: doctorLayout, w: MATCH_PARENT, h: Style.Height90)
        ll.add(view: dayHolder, w: MATCH_PARENT, h: Style.Height100)
        
        ll.add(view: sessionsLayout, w: MATCH_PARENT, h: sessionHeight)
        
        
        
        scroll = ll.createScrollable()
        view.addSubview(scroll)
        view.addSubview(linear)
        
        let nextBtn = nextButton()
        nextBtn.tg_centerX.equal(0)
        nextBtn.tg_top.equal(Style.ScreenHeight - Style.Height48)
        view.addSubview(nextBtn)
        
        menuButton.addTarget(self, action: #selector(onBackPressed), for: .touchUpInside)
        
    }
    
    
    func nextButton()->TGRelativeLayout{
        let main = TGRelativeLayout()
        let flat = RaisedButton(title: "", titleColor: .white)
        flat.tg_width.equal(Style.Width80)
        flat.tg_height.equal(Style.Height30)
        
        let text = getUILabel(text: "Book", size: Style.TextSize18, textColor: Style.AccentColor)
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
        if(selectedSlot == nil){
            self.view.makeToast("Select booking slot")
            return
        }
        
        let patient = PatientDetailsVC()
        patient.doctor = doctor
        patient.specilization = specilization
        patient.slot = selectedSlot
        patient.selectedDate = selectedDate
        present(patient, animated: true, completion: nil)
    }
    
    override
    func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if(fetched == false){
            getAppointmentSlots(position: 0)
            fetched = true
        }
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
        
        let horizontalScrollView:ASHorizontalScrollView = ASHorizontalScrollView(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - Style.Width90, height: Style.Height45))
        horizontalScrollView.marginSettings_320 = MarginSettings(leftMargin: 5, miniMarginBetweenItems: 1, miniAppearWidthOfLastItem: 20)
        horizontalScrollView.marginSettings_480 = MarginSettings(leftMargin: 5, miniMarginBetweenItems: 1, miniAppearWidthOfLastItem: 20)
        horizontalScrollView.marginSettings_414 = MarginSettings(leftMargin: 5, miniMarginBetweenItems: 1, miniAppearWidthOfLastItem: 20)
        horizontalScrollView.marginSettings_736 = MarginSettings(leftMargin: 5, miniMarginBetweenItems: 2, miniAppearWidthOfLastItem: 30)
        horizontalScrollView.defaultMarginSettings = MarginSettings(leftMargin: 5, miniMarginBetweenItems: 2, miniAppearWidthOfLastItem: 20)
        horizontalScrollView.uniformItemSize = CGSize(width: Style.Height30, height: Style.Height30)
        //horizontalScrollView.setItemsMarginOnce()
        
        var date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd"
        for index in 0..<14{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy"
            let year: String = dateFormatter.string(from: date)
            dateFormatter.dateFormat = "MM"
            let month: String = dateFormatter.string(from: date)
            dateFormatter.dateFormat = "dd"
            let day: String = dateFormatter.string(from: date)
            
            var cal = CalendarDate()
            cal.year = year
            cal.month = month
            cal.day = day
            var str = day
            str.append(" ")
            str.append(date.getMonthName())
            str.append(" ")
            str.append(year)
            cal.properDate = str
            dates.append(cal)
            horizontalScrollView.addItem(getVehicleCell(data : cal, tag : index))
            date = date.add(days: 1)
        }
        return horizontalScrollView;
    }
    
    
    
    
    func getVehicleCell(data : CalendarDate, tag : Int) -> UIView{
        let btn = getFlatButton(width : Int(Style.Height30), height : Int(Style.Height30)) ;
        let relativeLayout = TGRelativeLayout();
        relativeLayout.tg_width.equal(Style.Width30) ;
        relativeLayout.tg_height.equal(Style.Height30) ;
        //let logo = getVehicleImage(image: data.code) ;
        let name: UILabel = getUILabel(text: data.day, size: Style.TextSize16, textColor: Style.TextColor) ;
        name.tg_width.equal(Style.Height30)
        name.tg_height.equal(Style.Height30)
        name.textAlignment = .center
        name.tg_centerY.equal(0)
        name.tg_centerX.equal(0)
        //name.tg_left.equal(10)
        texts.append(name)
        
        let linearLayout = TGLinearLayout(.horz) ;
        linearLayout.tg_width.equal(Style.Height30) ;
        linearLayout.tg_height.equal(Style.Height30) ;
        //linearLayout.addSubview(logo) ;
        linearLayout.addSubview(name) ;
        
        let raised = getRaisedButton(width : Int(Style.Height30), height : Int(Style.Height30))
        //raised.backgroundColor = Style.AccentColor
        btns.append(raised)
        relativeLayout.addSubview(raised)
        relativeLayout.addSubview(linearLayout)
        relativeLayout.addSubview(btn) ;
        btn.tag = tag
        btn.addTarget(self, action: #selector(self.calItemClick(sender:)), for: .touchUpInside)
        relativeLayout.tg_centerY.equal(0)
        relativeLayout.tg_centerX.equal(0)
        
        let uiView = UIView()
        uiView.tg_width.equal(Style.Height30)
        uiView.tg_height.equal(Style.Height30)
        uiView.addSubview(relativeLayout)
        if(btnPosition == tag){
            btns[tag].backgroundColor = UIColor().HexToColor(hexString: "#3c7fd1")
            texts[tag].textColor = .white
        }
        return uiView;
    }
    
    //Returns the flat button with specified width and height...
    func getFlatButton(width : Int , height : Int) -> FlatButton{
        let btn = FlatButton(title : "",  titleColor : .white)
        btn.pulseColor = Style.TextColor ;
        btn.layer.cornerRadius = Style.Height30 / 2
        btn.tg_width.equal(width )
        btn.tg_height.equal(height)
        btn.tg_centerX.equal(0)
        btn.titleLabel?.textAlignment = .left
        return btn ;
    }
    
    @objc
    func calItemClick(sender: UIButton){
        print(dates[sender.tag].getDate())
        for i in 0..<14{
            btns[i].backgroundColor = .white
            texts[i].textColor = Style.TextColor
        }
        selectedDate = dates[sender.tag].properDate
        getAppointmentSlots(position : sender.tag)
    }
    
    //Returns the raised button with specified width and height...
    func getRaisedButton(width : Int, height : Int) -> RaisedButton{
        let btn = RaisedButton(title : "",  titleColor : .white)
        btn.pulseColor = .white ;
        btn.layer.cornerRadius = Style.Height30 / 2
        btn.tg_width.equal(width )
        btn.tg_centerX.equal(0)
        btn.tg_height.equal(height)
        btn.titleLabel?.textAlignment = .left
        return btn ;
    }
    
    func getAppointmentSlots(position : Int){
        btnPosition = position
        btns[position].backgroundColor = UIColor().HexToColor(hexString: "#3c7fd1")
        texts[position].textColor = .white
        let dialogBox = ConstructDialog.ConstructProgressDialog(dialogTitle: "Getting appointment slots", dialogMessage: "Please wait while we are getting appointment slots...")
        present(dialogBox, animated: true, completion: nil)
        self.selectedDate = dates[position].properDate
        var url = "http://www.bhavikagarwal.com/booking/apis/get_doctor_schedule_slots?doctor_id="
        url.append(String(doctor.id))
        url.append("&")
        url.append("date=")
        url.append(dates[position].getDate())
        print(url)
        Alamofire.request(url).responseJSON{ response in
            print(response)
            dialogBox.dismiss(animated: true, completion: nil)
            
            if(response.result != nil){
                self.selectedSlot = nil
                if(response.result.value != nil){
                    let responseJSON = response.result.value as! [String:AnyObject]
                    
                    let success = responseJSON["success"] as! Int ;
                    if(success == 0){
                        print("NULL RESULT")
                        self.slots = nil
                        self.btns.removeAll()
                        self.texts.removeAll()
                        self.dates.removeAll()
                        self.slotButtons.removeAll()
                        self.allSlots.removeAll()
                        self.linear.removeFromSuperview()
                        self.scroll.removeFromSuperview()
                        self.slotTexts.removeAll()
                        self.constructUI()
                        return
                    }
                    
                    let decoder = JSONDecoder()
                    self.slots = try! decoder.decode(BookingSlot.self, from: response.data!)
                    //self.list.reloadData()
                    self.linear.removeFromSuperview()
                    self.scroll.removeFromSuperview()
                    self.scroll = nil
                    self.btns.removeAll()
                    self.texts.removeAll()
                    self.dates.removeAll()
                    self.allSlots.removeAll()
                    self.slotButtons.removeAll()
                    self.slotTexts.removeAll()
                    self.constructUI()
                }else{
                    //Failed...
                }
            }else{
                //Failed
            }
        }
        
    }
    
    
    
    func getSessionSlot(position : Int)->TGLinearLayout{
        print("INIT")
        
        sessionHeight = sessionHeight + (Style.Height90)
        var nightImage : UIImageView!
        var heading : UILabel!;
        
        let slotLayout = TGLinearLayout(.horz)
        slotLayout.tg_width.equal(UIScreen.main.bounds.width - Style.Width45)
        slotLayout.tg_height.equal(.wrap)
        slotLayout.backgroundColor = UIColor().HexToColor(hexString: "#e9e7e8")
        nightImage = getUIImageView(sizeX: Int(Style.Height25), sizeY: Int(Style.Height25))
        nightImage.image = images[position]
        nightImage.tg_centerY.equal(0)
        
        let imageLayout = TGRelativeLayout()
        imageLayout.tg_width.equal(Style.Height45)
        imageLayout.tg_height.equal(Style.Height45)
        imageLayout.addSubview(nightImage)
        imageLayout.tg_centerY.equal(0)
        
        slotLayout.addSubview(imageLayout)

        let timingsLayout = TGLinearLayout(.vert)
        slotLayout.addSubview(timingsLayout)
        
        timingsLayout.tg_width.equal(UIScreen.main.bounds.width - Style.Width45  - Style.Width45)
        timingsLayout.tg_height.equal(.wrap)
        
        let timeSlots = TGLinearLayout(.vert)
        timeSlots.tg_width.equal(Style.ScreenWidth)
        timeSlots.tg_height.equal(.wrap)
        
        
        var head = headings[position]
        if(self.slots != nil){
            if(position == 0){
                if(slots.data?.slots?.morning != nil){
                    let count: Int = (slots.data?.slots?.morning?.count)!
                    if (count == 0){
                        head.append("\n Not Available")
                    }else{
                        var startPos : Int = 0
                        var endPos : Int = 0
                        for i in 0..<count{
                            if(i % 4 == 0 && i != 0){
                                endPos = startPos + 4
                                timeSlots.addSubview(getSlotRow(position: position, start: startPos, end: endPos))
                                print(startPos)
                                startPos = startPos + 4
                                print(endPos)
                            }
                        }
                        if(startPos < count){
                            timeSlots.addSubview(getSlotRow(position: position, start: startPos, end: count - 1))
                            
                        }
                    }
                    
                }else{
                    head.append("\n Not Available")
                }
            }else if(position == 1){
                if(slots.data?.slots?.afternoon != nil){
                    let count: Int = (slots.data?.slots?.afternoon?.count)!
                    if (count == 0){
                        head.append("\n Not Available")
                    }else{
                        var startPos : Int = 0
                        var endPos : Int = 0
                        for i in 0..<count{
                            if(i % 4 == 0 && i != 0){
                                endPos = startPos + 4
                                timeSlots.addSubview(getSlotRow(position: position, start: startPos, end: endPos))
                                print(startPos)
                                startPos = startPos + 4
                                print(endPos)
                            }
                        }
                        if(startPos < count){
                            timeSlots.addSubview(getSlotRow(position: position, start: startPos, end: count - 1))
                            
                        }
                    }
                }else{
                    head.append("\n Not Available")
                }
            }else if(position == 2){
                if(slots.data?.slots?.evening != nil){
                    
                    let count: Int = (slots.data?.slots?.evening?.count)!
                    if (count == 0){
                        head.append("\n Not Available")
                    }else{
                        var startPos : Int = 0
                        var endPos : Int = 0
                        for i in 0..<count{
                            if(i % 4 == 0 && i != 0){
                                endPos = startPos + 4
                                timeSlots.addSubview(getSlotRow(position: position, start: startPos, end: endPos))
                                print(startPos)
                                startPos = startPos + 4
                                print(endPos)
                            }
                        }
                        if(startPos < count){
                            timeSlots.addSubview(getSlotRow(position: position, start: startPos, end: count - 1))
                    
                        }
                    }
                }else{
                    head.append("\n Not Available")
                }
            }else if(position == 3){
                if(slots.data?.slots?.night != nil){
                    let count: Int = (slots.data?.slots?.night?.count)!
                    if (count == 0){
                        head.append("\n Not Available")
                    }else{
                        var startPos : Int = 0
                        var endPos : Int = 0
                        for i in 0..<count{
                            if(i % 4 == 0 && i != 0){
                                endPos = startPos + 4
                                timeSlots.addSubview(getSlotRow(position: position, start: startPos, end: endPos))
                                print(startPos)
                                startPos = startPos + 4
                                print(endPos)
                            }
                        }
                        if(startPos < count){
                            timeSlots.addSubview(getSlotRow(position: position, start: startPos, end: count - 1))
                            
                        }
                    }
                }else{
                    head.append("\n Not Available")
                }
            }
        }else{
            head.append("\n Not Available")
        }
        
        
        heading = getUILabel(text: head, size: Style.TextSize18, textColor: Style.TextColor);
        
        heading.textAlignment = .center
        heading.tg_top.equal(5)
        heading.tg_centerX.equal(0)
        timingsLayout.addSubview(heading)
        timingsLayout.backgroundColor = UIColor().HexToColor(hexString: "#f2f0f1")
        
        
        
        timingsLayout.addSubview(timeSlots)
        
        let main = TGLinearLayout(.vert)
        main.tg_width.equal(Style.ScreenWidth)
        main.tg_height.equal(.wrap)
        
        main.addSubview(slotLayout)
        
        let space = UIImageView()
        space.tg_width.equal(Style.ScreenWidth - Style.Width45)
        space.tg_height.equal(10)
        main.addSubview(space)
        
        main.tg_centerX.equal(0)
        return main
    }
    
    
    
    func getSlotRow(position : Int, start: Int, end : Int) -> ASHorizontalScrollView{
        
        let horizontalScrollView:ASHorizontalScrollView = ASHorizontalScrollView(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - Style.Width90, height: Style.Height30))
        horizontalScrollView.marginSettings_320 = MarginSettings(leftMargin: 5, miniMarginBetweenItems: 1, miniAppearWidthOfLastItem: 20)
        horizontalScrollView.marginSettings_480 = MarginSettings(leftMargin: 5, miniMarginBetweenItems: 1, miniAppearWidthOfLastItem: 20)
        horizontalScrollView.marginSettings_414 = MarginSettings(leftMargin: 5, miniMarginBetweenItems: 1, miniAppearWidthOfLastItem: 20)
        horizontalScrollView.marginSettings_736 = MarginSettings(leftMargin: 5, miniMarginBetweenItems: 2, miniAppearWidthOfLastItem: 30)
        horizontalScrollView.defaultMarginSettings = MarginSettings(leftMargin: 5, miniMarginBetweenItems: 2, miniAppearWidthOfLastItem: 20)
        horizontalScrollView.uniformItemSize = CGSize(width: UIScreen.main.bounds.width / 5 - 30, height: Style.Height20)
        //horizontalScrollView.setItemsMarginOnce()
        
        
        for index in start..<(end + 1){
            var info = SlotData()
            if(position == 0){
                info.id = (slots.data?.slots?.morning![index].id)!
                info.time = (slots.data?.slots?.morning![index].startTime)!
            }else if(position == 1){
                info.id = (slots.data?.slots?.afternoon![index].id)!
                info.time = (slots.data?.slots?.afternoon![index].startTime)!
            }else if(position == 2){
                info.id = (slots.data?.slots?.evening![index].id)!
                info.time = (slots.data?.slots?.evening![index].startTime)!
            }else if(position == 3){
                info.id = (slots.data?.slots?.night![index].id)!
                info.time = (slots.data?.slots?.night![index].startTime)!
            }
            allSlots.append(info)
            horizontalScrollView.addItem(getTimeSlotCell(title : info.getTime()))
        }
        //horizontalScrollView.tg_centerX.equal(0)
        return horizontalScrollView;
    }
    
    func getTimeSlotCell(title : String)->TGRelativeLayout{
        var layoutMain = TGRelativeLayout()
        layoutMain.tg_width.equal(UIScreen.main.bounds.width / 5 - 30)
        layoutMain.tg_height.equal(Style.Height20)
        
        var label = getUILabel(text: title, size: Style.TextSize16, textColor: Style.TextColor)
        label.tg_centerX.equal(0)
        label.tg_centerY.equal(0)
        //label.textColor = Style.TextColor
        //label.tg_margin(20)
        layoutMain.backgroundColor = .white
        
        layoutMain.tg_topBorderline = TGBorderline.init(color: UIColor.gray)
        layoutMain.tg_leftBorderline = TGBorderline.init(color: UIColor.gray)
        layoutMain.tg_rightBorderline = TGBorderline.init(color: UIColor.gray)
        layoutMain.tg_bottomBorderline = TGBorderline.init(color: UIColor.gray)
        
        let flat = RaisedButton(title: "", titleColor: Style.TextColor)
        flat.tg_width.equal(UIScreen.main.bounds.width / 5 - 30)
        flat.tg_height.equal(Style.Height20)
        layoutMain.addSubview(flat)
        layoutMain.addSubview(label)
        slotButtons.append(flat)
        slotTexts.append(label)
        flat.tag = slotButtons.count - 1
        flat.addTarget(self, action: #selector(slotCellClick(sender:)), for: .touchUpInside)

        return layoutMain
    }
    
    @objc
    func slotCellClick(sender : UIButton){
        print(allSlots[sender.tag].getTime())
        selectedSlot = allSlots[sender.tag]
        for i in 0..<allSlots.count{
            slotButtons[i].backgroundColor = .white
            slotTexts[i].textColor = Style.TextColor
        }
        slotButtons[sender.tag].backgroundColor = Style.AccentColor
        slotTexts[sender.tag].textColor = .white
        print(allSlots[sender.tag].id)
    }
    
}


extension Date {
    
    /// Returns a Date with the specified days added to the one it is called with
    func add(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date {
        var targetDay: Date
        targetDay = Calendar.current.date(byAdding: .year, value: years, to: self)!
        targetDay = Calendar.current.date(byAdding: .month, value: months, to: targetDay)!
        targetDay = Calendar.current.date(byAdding: .day, value: days, to: targetDay)!
        targetDay = Calendar.current.date(byAdding: .hour, value: hours, to: targetDay)!
        targetDay = Calendar.current.date(byAdding: .minute, value: minutes, to: targetDay)!
        targetDay = Calendar.current.date(byAdding: .second, value: seconds, to: targetDay)!
        return targetDay
    }
    
    /// Returns a Date with the specified days subtracted from the one it is called with
    func subtract(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date {
        let inverseYears = -1 * years
        let inverseMonths = -1 * months
        let inverseDays = -1 * days
        let inverseHours = -1 * hours
        let inverseMinutes = -1 * minutes
        let inverseSeconds = -1 * seconds
        return add(years: inverseYears, months: inverseMonths, days: inverseDays, hours: inverseHours, minutes: inverseMinutes, seconds: inverseSeconds)
    }
    
    func getMonthName() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        let strMonth = dateFormatter.string(from: self)
        return strMonth
    }
    
}


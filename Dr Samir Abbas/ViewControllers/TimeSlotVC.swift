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

class TimeSlotVC : BaseVC, UITableViewDataSource, UITableViewDelegate {
    
    var specilization : String!
    var doctor : Doctor!
    var dates = [CalendarDate]()
    var btns = [RaisedButton]()
    var texts = [UILabel]()
    
    var list : UITableView!
    
    var slots : BookingSlot!
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        dates.reserveCapacity(14)
        btns.reserveCapacity(14)
        texts.reserveCapacity(14)
        
        
        let relative = TGLinearLayout(.vert)
        relative.tg_width.equal(UIScreen.main.bounds.width)
        relative.tg_height.equal(UIScreen.main.bounds.height)
        
        relative.addSubview(getToolbar(title: "Select a time slot", isBackMenu: true, addSpinner : false))
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
        
        let main = TGLinearLayout(.vert)
        main.tg_width.equal(Style.ScreenWidth)
        main.tg_height.equal(Style.ScreenHeight - Style.Height50)
        
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

        main.addSubview(doctorLayout)

        
        
        //===============DAY SELECTOR===========
        let dayHolder = TGLinearLayout(.vert)
        dayHolder.tg_width.equal(UIScreen.main.bounds.width - Style.Width45)
        dayHolder.tg_height.equal(.wrap)
        dayHolder.tg_top.equal(20)
        dayHolder.tg_backgroundImage = #imageLiteral(resourceName: "cal_background")
        dayHolder.tg_centerX.equal(0)
        let weekSchedule = getUILabel(text: "Schedule", size: 18, textColor: UIColor().HexToColor(hexString: "#ff640f"))
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
        
        calLayout.addSubview(getUILabel(text: date.getMonthName().uppercased(), size: 16, textColor: UIColor().HexToColor(hexString: "#3c7fd1")))
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
        daysLayout.tg_bottom.equal(20)
        
        dayHolder.addSubview(daysLayout)
        //
    
        main.addSubview(dayHolder)
//
//        let master = LinearLayout(width: MATCH_PARENT, height: 600)
//        master.backgroundColor = Style.AccentColor
//        relative.addSubview(getSlotLayout(position: 0))
//
//        relative.addSubview(getSlotLayout(position: 0))
//        relative.addSubview(getSlotLayout(position: 0))
//        relative.addSubview(getSlotLayout(position: 0))
//        relative.addSubview(getSlotLayout(position: 0))
//
        list = UITableView()
        list.tg_width.equal(UIScreen.main.bounds.width)
        list.tg_height.equal(Style.ScreenHeight / 2)
        list.separatorColor = Style.Transparent
        list.backgroundColor = Style.BackgroundColor
        list.tg_top.equal(10)
        list.allowsSelection = false
        
        
        list.register(SlotCell.self, forCellReuseIdentifier: "cell")
        list.dataSource = self
        list.delegate = self
        main.addSubview(list)
        
        
        relative.addSubview(main)
        view.addSubview(relative)

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
            dates.append(cal)
            horizontalScrollView.addItem(getVehicleCell(data : cal, tag : index))
            date = date.add(days: 1)
        }
        getAppointmentSlots(position: 0)
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
        btns[position].backgroundColor = UIColor().HexToColor(hexString: "#3c7fd1")
        texts[position].textColor = .white
        let dialogBox = ConstructDialog.ConstructProgressDialog(dialogTitle: "Getting appointment slots", dialogMessage: "Please wait while we are getting appointment slots...")
        present(dialogBox, animated: true, completion: nil)
        
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
                if(response.result.value != nil){
                    let responseJSON = response.result.value as! [String:AnyObject]
                    
                    let success = responseJSON["success"] as! Int ;
                    if(success == 0){
                        print("NULL RESULT")
                        return
                    }
                    
                    let decoder = JSONDecoder()
                    self.slots = try! decoder.decode(BookingSlot.self, from: response.data!)
                    self.list.reloadData()
                }else{
                    //Failed...
                }
            }else{
                //Failed
            }
        }
        
    }
    
    
    
    //the method returning each cell of the list
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var cell:SlotCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SlotCell

        return cell;
    }
    
    //the method returning size of the list
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 4
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(self.slots == nil){
            //default height...
            return 80;
        }
        
        return 120
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


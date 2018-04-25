//
//  SpecialistDoctorListVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 13/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import Material
import UIKit
import TangramKit
import Alamofire
import Kingfisher

class SpecialistDoctorListVC : BaseVC, UITableViewDataSource, UITableViewDelegate {
    
    var specialisationList : Specialization!
    var position : Int!
    var doctors : Doctors!
    var list : UITableView!
    
    var fetched : Bool!
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        fetched = false;
        
        let master = TGRelativeLayout()
        master.tg_width.equal(UIScreen.main.bounds.width)
        master.tg_height.equal(UIScreen.main.bounds.height)
        
        let relative = TGLinearLayout(.vert)
        relative.tg_width.equal(UIScreen.main.bounds.width)
        relative.tg_height.equal(UIScreen.main.bounds.height)
        
        relative.addSubview(getToolbar(title: "find_and_book".localizedString, isBackMenu: true, addSpinner : true))
        master.addSubview(relative)
        view.addSubview(master)
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
        
        let drop = UIDropDown(frame: CGRect(x: 0, y: 0, width: 200, height: Style.Height48))
        drop.title.textColor = Style.AccentColor
        
        drop.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        
        if(Language.language == Language.arabic){
            drop.placeholder = specialisationList.data.specializations[position].name_ar
        }else{
            drop.placeholder = specialisationList.data.specializations[position].name
        }
        
        drop.options = []
        for name in specialisationList.data.specializations{
            if(Language.language == Language.arabic){
                drop.options.append(name.name_ar)
            }else{
                drop.options.append(name.name)
            }
        }
        drop.didSelect { (option, index) in
            //self.label.text = "You just select \(option) at index: \(index)"
            print("You just select: \(option) at index: \(index)")
            drop.hideTable()
            self.position = index
            self.getDoctorList()
        }
        drop.borderColor2 = Style.Transparent
        drop.tg_top.equal(5)
        master.addSubview(drop)
        
        list = UITableView()
        list.tg_width.equal(UIScreen.main.bounds.width)
        list.tg_height.equal(UIScreen.main.bounds.height - Style.Height60)
        list.separatorColor = Style.Transparent
        list.backgroundColor = Style.BackgroundColor
        list.tg_top.equal(10)
        list.allowsSelection = false
        list.rowHeight = Style.Height120
        
        list.register(DoctorCell.self, forCellReuseIdentifier: "cell")
        list.dataSource = self
        list.delegate = self
        
        relative.addSubview(list)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if(fetched == false){
            getDoctorList()
        }
    }
    
    @objc
    func onBackPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func getDoctorList(){
        let dialogBox = ConstructDialog.ConstructProgressDialog(dialogTitle: "getting_doctor".localizedString, dialogMessage: "getting_doctor_msg".localizedString)
        present(dialogBox, animated: true, completion: nil)
     
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        
        print(result)
        var url = "http://www.bhavikagarwal.com/booking/apis/get_doctors?specialization_id="
        url.append(String (specialisationList.data.specializations[position].id))
        url.append("&available_on=")
        url.append(result)
        Alamofire.request(url).responseJSON{ response in
            print(response)
            dialogBox.dismiss(animated: true, completion: nil)
            if(response.result != nil){
                if(response.result.value != nil){
                    let responseJSON = response.result.value as! [String:AnyObject]
                    let decoder = JSONDecoder()
                    self.doctors = try! decoder.decode(Doctors.self, from: response.data!)
                    self.fetched = true
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
        var cell:DoctorCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DoctorCell
        let url = URL(string: doctors.data.doctors[indexPath.row].profilePictureURL)
        cell.docImage.kf.setImage(with: url)
        
        if(doctors.data.doctors[indexPath.row].isAvailableToday == true){
            cell.available.isHidden = false;
            cell.available.textColor = Style.AccentColor
        }else{
            cell.available.isHidden = false;
            cell.available.textColor = .white
        }
        
        var docName = "Dr "
        if(Language.language == Language.arabic){
            docName.append(doctors.data.doctors[indexPath.row].name_ar)
        }else{
            docName.append(doctors.data.doctors[indexPath.row].name)
        }
        
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: Style.TextSize18)]
        let attributedString = NSMutableAttributedString(string: docName, attributes:attrs)
        
        cell.name.attributedText = attributedString
        
        let attrs2 = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: Style.TextSize16)]
        let attributedString2 = NSMutableAttributedString(string: doctors.data.doctors[indexPath.row].experience, attributes:attrs2)
        
        
        cell.experience.attributedText = attributedString2
        
        var spec = ""
        for specilization in specialisationList.data.specializations{
            if(doctors.data.doctors[indexPath.row].speID.elementsEqual(String( specilization.id))){
                spec = specilization.name
            }
        }
        let attrs3 = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: Style.TextSize16)]
        let attributedString3 = NSMutableAttributedString(string: spec, attributes:attrs3)
        
        cell.specialization.attributedText = attributedString3
        
        
        let attrs4 = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: Style.TextSize14)]
        let attributedString4 = NSMutableAttributedString(string: doctors.data.doctors[indexPath.row].degree, attributes:attrs4)
        
        cell.qualification.attributedText = attributedString4
        
        cell.book.tag = indexPath.row
        cell.book.addTarget(self, action: #selector(self.book(sender:)), for: .touchUpInside)
        return cell
    }
    
    //the method returning size of the list
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if(doctors == nil){
            return 0
        }
        return doctors.data.doctors.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    
    @objc
    func book(sender: UIButton){
        let timeSlot = TimeSlotVC()
        timeSlot.doctor = doctors.data.doctors[sender.tag]
        var spec = ""
        for specilization in specialisationList.data.specializations{
            if(doctors.data.doctors[sender.tag].speID.elementsEqual(String( specilization.id))){
                spec = specilization.name
            }
        }
        
        timeSlot.specilization = spec
        self.present(timeSlot, animated: true, completion: nil)
    }
}


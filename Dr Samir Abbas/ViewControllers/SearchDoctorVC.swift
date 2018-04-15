//
//  SearchDoctorVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 10/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import UIKit
import TangramKit
import Material
import Alamofire

class SearchDoctorVC : BaseVC, UITableViewDataSource, UITableViewDelegate  {
    var doctors : Doctors!
    var list : UITableView!
    
    var specialization : Specialization!
    var listFetched : Bool!

    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        listFetched = false;
        let master = TGRelativeLayout()
        master.tg_width.equal(UIScreen.main.bounds.width)
        master.tg_height.equal(UIScreen.main.bounds.height)
        
        let relative = TGLinearLayout(.vert)
        relative.tg_width.equal(UIScreen.main.bounds.width)
        relative.tg_height.equal(UIScreen.main.bounds.height)
        
        relative.addSubview(getToolbar(title: "Search a doctor", isBackMenu: true, addSpinner : false))
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
        
        
        let search = DTTextField()
        search.tg_width.equal(UIScreen.main.bounds.width - 40)
        search.tg_height.equal(Style.Height48)
        //search.tg_top.equal(20)
        search.placeholder = "Search a doctor"
        search.textAlignment = .center
        search.floatPlaceholderColor = Style.AccentColor
        search.floatPlaceholderActiveColor = Style.AccentColor
        search.cornerRadiusPreset = CornerRadiusPreset.cornerRadius1
        search.tg_centerX.equal(0)
        relative.addSubview(search)
        
        let searchLayout = TGRelativeLayout()
        searchLayout.tg_width.equal(UIScreen.main.bounds.width - 40)
        searchLayout.tg_height.equal(Style.Height48)
        searchLayout.addSubview(search)
        searchLayout.tg_centerX.equal(0)
        searchLayout.tg_top.equal(20)
        
        let searchIcon = getUIImageView(sizeX: 20, sizeY: 20)
        searchIcon.image = getUIImage(image: "search_icon.png", resizeX: 20, resizeY: 20)
        searchIcon.tg_centerY.equal(0)
        searchIcon.tg_left.equal(10)
        searchLayout.addSubview(searchIcon)
        relative.addSubview(searchLayout)
        
        
        list = UITableView()
        list.tg_width.equal(UIScreen.main.bounds.width)
        list.tg_height.equal(UIScreen.main.bounds.height - Style.Height60 - Style.Height60)
        list.separatorColor = Style.Transparent
        list.backgroundColor = Style.BackgroundColor
        list.tg_top.equal(10)
        list.allowsSelection = false
        list.rowHeight = Style.Height120
        
        list.register(DoctorCell.self, forCellReuseIdentifier: "cell")
        list.dataSource = self
        list.delegate = self
        
        relative.addSubview(list)
        
        //master.addSubview(drop)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if(listFetched == false){
            if(specialization == nil){
                get_specializations()
            }else{
                getAllDoctors()
            }
        }
    }
    
    @objc
    func onBackPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func get_specializations(){
        let dialogBox = ConstructDialog.ConstructProgressDialog(dialogTitle: "Getting specialization", dialogMessage: "Please wait while we are getting specialization list")
        present(dialogBox, animated: true, completion: nil)
        
        
        Alamofire.request("https://hospoital.000webhostapp.com/booking-apis/apis/get_specializations").responseJSON{ response in
            print(response)
            dialogBox.dismiss(animated: true, completion: nil)
            if(response.result != nil){
                if(response.result.value != nil){
                    let responseJSON = response.result.value as! [String:AnyObject]
                    let decoder = JSONDecoder()
                    self.specialization = try! decoder.decode(Specialization.self, from: response.data!)
                    self.listFetched = true
                    self.getAllDoctors()
                }else{
                    //Failed...
                }
            }else{
                //Failed
            }
        }
    }
    
    func getAllDoctors(){
        let dialogBox = ConstructDialog.ConstructProgressDialog(dialogTitle: "Getting doctors list", dialogMessage: "Please wait while we are getting doctors list")
        present(dialogBox, animated: true, completion: nil)
        
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        
        print(result)
        var url = "https://hospoital.000webhostapp.com/booking-apis/apis/search_doctors?"
        //url.append(String (specialisationList.data.specializations[position].id))
        url.append("available_on=")
        url.append(result)
        url.append("&name=")
        Alamofire.request(url).responseJSON{ response in
            print(response)
            dialogBox.dismiss(animated: true, completion: nil)
            if(response.result != nil){
                if(response.result.value != nil){
                    let responseJSON = response.result.value as! [String:AnyObject]
                    let decoder = JSONDecoder()
                    self.doctors = try! decoder.decode(Doctors.self, from: response.data!)
                    
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
        }else{
            cell.available.isHidden = true;
        }
        
        var docName = "Dr "
        docName.append(doctors.data.doctors[indexPath.row].name)
        
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: Style.TextSize18)]
        let attributedString = NSMutableAttributedString(string: docName, attributes:attrs)
        
        cell.name.attributedText = attributedString
        
        let attrs2 = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: Style.TextSize16)]
        let attributedString2 = NSMutableAttributedString(string: doctors.data.doctors[indexPath.row].experience, attributes:attrs2)
        
        
        cell.experience.attributedText = attributedString2
        
        var spec = ""
        for specilization in specialization.data.specializations{
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
    
    func getUIImageView(sizeX : Int, sizeY : Int) -> UIImageView{
        let image = UIImageView()
        image.tg_width.equal(sizeX)
        image.tg_height.equal(sizeY)
        return image
    }
    
    func getUIImage(image : String, resizeX : CGFloat, resizeY : CGFloat) -> UIImage{
        var left = UIImage(named: image)
        left = left?.resize(toHeight: resizeX)
        left = left?.resize(toWidth: resizeY)
        return left!
    }
}

//
//  BookAppointmentVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 08/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import Material
import TangramKit
import UIKit
import Alamofire

class BookAppointmentVC : BaseVC, UITableViewDataSource, UITableViewDelegate {
    
    var specialization : Specialization!
    var list : UITableView!
    
    var listFetched : Bool!
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        listFetched = false
        
        let relative = TGLinearLayout(.vert)
        relative.tg_width.equal(UIScreen.main.bounds.width)
        relative.tg_height.equal(UIScreen.main.bounds.height)
        
        relative.addSubview(getToolbar(title: "find_and_book".localizedString, isBackMenu: true, addSpinner : false))
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
        
        let search = RaisedButton(title: "", titleColor: Style.TextColor)
        search.tg_width.equal(UIScreen.main.bounds.width - 40)
        search.tg_height.equal(Style.Height48)
        search.addTarget(self, action: #selector(searchDoctor), for: .touchUpInside)
        
        let chooseLabel2 = UILabel()
        chooseLabel2.tg_width.equal(UIScreen.main.bounds.width)
        chooseLabel2.tg_height.equal(Style.Height48)
        let attrs2 = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: Style.TextSize18)]
        let attributedString2 = NSMutableAttributedString(string: "search_doc".localizedString, attributes:attrs2)
        chooseLabel2.attributedText = attributedString2
        chooseLabel2.tg_centerX.equal(0)
        chooseLabel2.textAlignment = .center
        chooseLabel2.textColor = Style.TextColor
        
        let searchLayout = TGRelativeLayout()
        searchLayout.tg_width.equal(UIScreen.main.bounds.width - 40)
        searchLayout.tg_height.equal(Style.Height48)
        searchLayout.addSubview(search)
        searchLayout.addSubview(chooseLabel2)
        searchLayout.tg_centerX.equal(0)
        searchLayout.tg_top.equal(20)

        let searchIcon = getUIImageView(sizeX: 20, sizeY: 20)
        searchIcon.image = getUIImage(image: "search_icon.png", resizeX: 20, resizeY: 20)
        searchIcon.tg_centerY.equal(0)
        searchIcon.tg_left.equal(10)
        searchLayout.addSubview(searchIcon)
        relative.addSubview(searchLayout)
        
        
        let bookLabel = UILabel()
        bookLabel.tg_width.equal(.wrap)
        bookLabel.tg_height.equal(.wrap)
        bookLabel.text = "or".localizedString
        bookLabel.tg_centerX.equal(0)
        bookLabel.tg_top.equal(8)
        bookLabel.textColor = Style.TextColor
        
        relative.addSubview(bookLabel)
        
        let chooseLabel = UILabel()
        chooseLabel.tg_width.equal(UIScreen.main.bounds.width)
        chooseLabel.tg_height.equal(Style.Height48)
        let attrs = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: Style.TextSize18)]
        let attributedString = NSMutableAttributedString(string: "choose_specialist".localizedString, attributes:attrs)
        chooseLabel.attributedText = attributedString
        chooseLabel.tg_centerX.equal(0)
        chooseLabel.textAlignment = .center
        chooseLabel.tg_top.equal(8)
        chooseLabel.textColor = Style.TextColor
        chooseLabel.backgroundColor = .white
        relative.addSubview(chooseLabel)
        
        list = UITableView()
        list.tg_width.equal(UIScreen.main.bounds.width)
        list.tg_height.equal(UIScreen.main.bounds.height - Style.Height48 * 5)
        list.separatorColor = Style.Transparent
        list.backgroundColor = Style.BackgroundColor
        list.tg_left.equal(19)
        list.tg_right.equal(19)
        list.allowsSelection = false
        list.rowHeight = Style.Height60
        list.tg_top.equal(30)
        
        list.register(SpecialityCell.self, forCellReuseIdentifier: "cell")
        list.dataSource = self
        list.delegate = self
        
        relative.addSubview(list)
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if(listFetched == true){
            return
        }
        //Get the specailization list
        get_specializations()
    }
    
    @objc
    func onBackPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //the method returning each cell of the list
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var cell:SpecialityCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SpecialityCell
        var val = specialization.data.specializations[indexPath.row].name
        
        if(Language.language == Language.arabic){
            val = specialization.data.specializations[indexPath.row].name_ar
        }
        
        let attrs = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: Style.TextSize16)]
        let attributedString = NSMutableAttributedString(string: val, attributes:attrs)
        cell.routeName.attributedText = attributedString
        cell.firstLetter.text = String (val[val.startIndex])
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(self.specialitiClicked(sender:)), for: .touchUpInside)
        return cell
    }
    
    //the method returning size of the list
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if(specialization == nil){
            return 0
        }
        return specialization.data.specializations.count
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
    
    @objc
    func searchDoctor(){
        let searchDoctor = SearchDoctorVC()
        searchDoctor.specialization = specialization
        self.present(searchDoctor, animated: true, completion: nil)
    }
    
    func get_specializations(){
        let dialogBox = ConstructDialog.ConstructProgressDialog(dialogTitle: "getting_special".localizedString, dialogMessage: "getting_special_msg".localizedString)
        present(dialogBox, animated: true, completion: nil)
        
        
        Alamofire.request("http://www.bhavikagarwal.com/booking/apis/get_specializations").responseJSON{ response in
            print(response)
            dialogBox.dismiss(animated: true, completion: nil)
            if(response.result != nil){
                if(response.result.value != nil){
                    let responseJSON = response.result.value as! [String:AnyObject]
                    let decoder = JSONDecoder()
                    self.specialization = try! decoder.decode(Specialization.self, from: response.data!)
                    self.list.reloadData()
                    self.listFetched = true
                }else{
                    //Failed...
                }
            }else{
                //Failed
            }
        }
    }
    
    @objc
    func specialitiClicked(sender: UIButton){
        let specialistDoctorList = SpecialistDoctorListVC()
        specialistDoctorList.specialisationList = specialization
        specialistDoctorList.position = sender.tag
        present(specialistDoctorList, animated: true, completion: nil)
    }
}

//
//  ServicesListVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 15/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import Material
import TangramKit
import UIKit

class ServicesListVC : BaseVC {
    
    var images = [#imageLiteral(resourceName: "women"), #imageLiteral(resourceName: "obstetrics"), #imageLiteral(resourceName: "reproductive"), #imageLiteral(resourceName: "maternal_fetal_medicine"), #imageLiteral(resourceName: "andrology"), #imageLiteral(resourceName: "dermotology"), #imageLiteral(resourceName: "surgery"), #imageLiteral(resourceName: "pediatrics"), #imageLiteral(resourceName: "plastic_surgery"), #imageLiteral(resourceName: "womens_breast"), #imageLiteral(resourceName: "bariatric_surgery"), #imageLiteral(resourceName: "ophthalmology"), #imageLiteral(resourceName: "oto"), #imageLiteral(resourceName: "rthopaedics"), #imageLiteral(resourceName: "pulmonologist"), #imageLiteral(resourceName: "gastroenterology"), #imageLiteral(resourceName: "non_invasive_cardiology"), #imageLiteral(resourceName: "anaesthesia"), #imageLiteral(resourceName: "intensive_care_unit"), #imageLiteral(resourceName: "dietary_services"), #imageLiteral(resourceName: "stem_cells"), #imageLiteral(resourceName: "emergency"), #imageLiteral(resourceName: "pediatrics")]
    
    var scrollHeight : CGFloat!
    
    var btn = [FlatButton]()
    
    var desc = [UILabel]()
    
    var status = [Bool]()
    
    var descImage = [UIImageView]()
    
    var heading = ["Women’s Health Department", "General Obstetrics and Gynaecology", "Reproductive Endocrinology", "Maternal Fetal Medicine", "Andrology", "Dermatology / Cosmetology", "Surgery", "Urology", "Plastic Surgery", "Women’s Breast Disease", "Bariatric Surgery", "Ophthalmology", "Oto-rhinolaryngology (ENT)", "Orthopaedics", "Pulmonology", "Gastroenterology", "Non-invasive Cardiology", "Anaesthesia", "Intensive Care Unit (ICU-Adults)", "Dietary Services", "Stem Cells / Rejuvenate Therapy", "Emergency Medicine department", "Pediatrics and neonatal department"]

    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        scrollHeight = 0

        status.reserveCapacity(23)
        btn.reserveCapacity(23)
        desc.reserveCapacity(23)
        descImage.reserveCapacity(23)
        
        for i in 0..<23{
            status.append(false)
        }
        
        let relative = TGLinearLayout(.vert)
        relative.tg_width.equal(UIScreen.main.bounds.width)
        relative.tg_height.equal(.wrap)
        
        relative.addSubview(getToolbar(title: "Services", isBackMenu: true, showNotification : false))
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
        
        
        scrollHeight = scrollHeight + Style.ScreenHeight / 4
        
        let banner = UIImageView()
        banner.tg_width.equal(UIScreen.main.bounds.width)
        banner.tg_height.equal(UIScreen.main.bounds.height / 4)
        banner.image = #imageLiteral(resourceName: "contact_us_samir_abbas")
        banner.contentMode = UIViewContentMode.scaleAspectFill
        
        
        scrollHeight = scrollHeight + Style.Height48 * 23 + 23 * 19
        var ll = LinearLayout(width: MATCH_PARENT, height: scrollHeight).vertical()
        ll.padding(left: 0, right: 0, top: Style.Height110, bottom: 0)
        ll.add(view: banner, w: MATCH_PARENT, h: Style.ScreenHeight / 4)
        
        for i in 0..<23{
            ll.add(view: getCell(position : i), w: UIScreen.main.bounds.width, h: WRAP_CONTENT)
        }

        
        
        view.addSubview(ll.createScrollable())
        view.addSubview(relative)
        view.backgroundColor = Style.BackgroundColor
    }
    
    func getCell(position : Int) -> TGLinearLayout{
        
        var routeName: UILabel!
        var firstLetter : UILabel!
        var button : FlatButton!
        
        let masterMain = LinearLayout(width: MATCH_PARENT, height: WRAP_CONTENT).vertical()
        
        
        let main = TGRelativeLayout()
        main.tg_width.equal(UIScreen.main.bounds.width - 40)
        main.tg_height.equal(.wrap)
        main.tg_centerX.equal(0)
        
        //var padTop = UIScreen.main.bounds.height / 4 + CGFloat(position * 10) + CGFloat(position + 1) * (Style.Height48 + UIScreen.main.bounds.height / 4 )
        
        
        var padTop = UIScreen.main.bounds.height / 4 + CGFloat(position * 10) + CGFloat(position + 4) * (Style.Height48)
        
        button = FlatButton(title: "", titleColor: .white)
        button.tg_width.equal(UIScreen.main.bounds.width - 40)
        button.tg_height.equal(Style.Height48)
        button.tg_centerX.equal(0)
        button.tg_centerY.equal(0)
        
        
        button.backgroundColor = .white
        main.addSubview(button)
        
        btn.append(button)
        btn[position].tag = position
        btn[position].addTarget(self, action: #selector(expand(sender:)), for: .touchUpInside)
        
        routeName = UILabel() // not sure how to refer to the cell size here
        routeName.tg_width.equal(.wrap)
        routeName.tg_height.equal(.wrap)
        routeName.tg_centerY.equal(0)
        routeName.tg_left.equal(Style.Width60)
        routeName.text = heading[position]
        //routeName.tg_centerX.equal(0)
        
        firstLetter = UILabel() // not sure how to refer to the cell size here
        firstLetter.tg_width.equal(.wrap)
        firstLetter.tg_height.equal(.wrap)
        firstLetter.tg_centerY.equal(0)
        var val = heading[position]
        firstLetter.text = String (val[val.startIndex])
        firstLetter.layer.cornerRadius = firstLetter.frame.height / 2
        firstLetter.layer.masksToBounds = true
        firstLetter.tg_centerX.equal(0)
        firstLetter.textColor = .white
        routeName.textColor = Style.TextColor
        
        let circle = UIView()
        circle.tg_height.equal(Style.Height30)
        circle.tg_width.equal(Style.Height30)
        circle.backgroundColor = UIColor().HexToColor(hexString: "#70d8cf")
        circle.tg_centerX.equal(0)
        circle.tg_centerY.equal(0)
        circle.layer.cornerRadius = Style.Height30 / 2
        
        let firstLayout = TGRelativeLayout()
        firstLayout.tg_width.equal(Style.Height48)
        firstLayout.tg_height.equal(Style.Height48)
        firstLayout.addSubview(circle)
        firstLayout.addSubview(firstLetter)
        firstLayout.backgroundColor = .white
        
        main.addSubview(firstLayout)
        main.addSubview(routeName)
        
        let headingImage = UIImageView()
        headingImage.tg_width.equal(UIScreen.main.bounds.width - 40)
        headingImage.tg_height.equal(UIScreen.main.bounds.height / 4)
        headingImage.image = images[position]
        //main.addSubview(headingImage)
        descImage.append(headingImage)
        descImage[position].isHidden = true
        
        
        main.backgroundColor = Style.BackgroundColor
        main.borderColor = UIColor.gray
        main.tg_topBorderline = TGBorderline.init(color: UIColor.gray)
        main.tg_bottomBorderline = TGBorderline.init(color: UIColor.gray)
        main.tg_leftBorderline = TGBorderline.init(color: UIColor.gray)
        main.tg_rightBorderline = TGBorderline.init(color: UIColor.gray)
        
        let master = TGLinearLayout(.vert)
        master.tg_width.equal(Style.ScreenWidth - 40)
        master.tg_height.equal(.wrap)
        master.addSubview(main)
        master.tg_centerX.equal(0)
        master.tg_top.equal(padTop)
        master.addSubview(headingImage)
        return master
    }
    
    @objc
    func onBackPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc
    func expand(sender : UIButton){
        print(sender.tag)
        for i in 0..<23{
            status[i] = false
            //Collapse that view...
            descImage[i].isHidden = true
        }
        //Finally expand new view...
        status[sender.tag] = true
        descImage[sender.tag].isHidden = false
    }
    
}

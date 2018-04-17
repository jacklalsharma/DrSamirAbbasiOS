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

class ServicesListVC : BaseVC, UITableViewDataSource, UITableViewDelegate {
    
    var images = [#imageLiteral(resourceName: "women"), #imageLiteral(resourceName: "obstetrics"), #imageLiteral(resourceName: "reproductive"), #imageLiteral(resourceName: "maternal_fetal_medicine"), #imageLiteral(resourceName: "andrology"), #imageLiteral(resourceName: "dermotology"), #imageLiteral(resourceName: "surgery"), #imageLiteral(resourceName: "pediatrics"), #imageLiteral(resourceName: "plastic_surgery"), #imageLiteral(resourceName: "womens_breast"), #imageLiteral(resourceName: "bariatric_surgery"), #imageLiteral(resourceName: "ophthalmology"), #imageLiteral(resourceName: "oto"), #imageLiteral(resourceName: "rthopaedics"), #imageLiteral(resourceName: "pulmonologist"), #imageLiteral(resourceName: "gastroenterology"), #imageLiteral(resourceName: "non_invasive_cardiology"), #imageLiteral(resourceName: "anaesthesia"), #imageLiteral(resourceName: "intensive_care_unit"), #imageLiteral(resourceName: "dietary_services"), #imageLiteral(resourceName: "stem_cells"), #imageLiteral(resourceName: "emergency"), #imageLiteral(resourceName: "pediatrics")]
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        let relative = TGLinearLayout(.vert)
        relative.tg_width.equal(UIScreen.main.bounds.width)
        relative.tg_height.equal(UIScreen.main.bounds.height)
        
        relative.addSubview(getToolbar(title: "Services", isBackMenu: true, showNotification : false))
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
        
        let banner = UIImageView()
        banner.tg_width.equal(UIScreen.main.bounds.width)
        banner.tg_height.equal(UIScreen.main.bounds.height / 3)
        banner.image = #imageLiteral(resourceName: "contact_us_samir_abbas")
        relative.addSubview(banner)
        
        var list = UITableView()
        list.tg_width.equal(UIScreen.main.bounds.width)
        list.tg_height.equal(UIScreen.main.bounds.height - Style.Height48 - UIScreen.main.bounds.height / 3 - 10)
        list.separatorColor = Style.Transparent
        list.backgroundColor = Style.BackgroundColor
        list.tg_top.equal(10)
        list.allowsSelection = false
        //list.rowHeight = Style.Height60
        list.estimatedRowHeight = Style.Height60
        list.rowHeight = UITableViewAutomaticDimension
        
        
        list.register(ServicesCell.self, forCellReuseIdentifier: "cell")
        list.dataSource = self
        list.delegate = self
        
        relative.addSubview(list)
        
        
        
    }
    
    
    //the method returning each cell of the list
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var cell:ServicesCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ServicesCell
        
        return cell
    }
    
    //the method returning size of the list
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2000
    }
    
    
    @objc
    func onBackPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
}

//
//  LeftSlideMenuVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 09/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import UIKit
import Material
import TangramKit

class LeftSlideMenuVC : DPBaseEmbedViewController, UITableViewDataSource, UITableViewDelegate {
    
    var images = [#imageLiteral(resourceName: "nav_home"), #imageLiteral(resourceName: "nav_about_us"),#imageLiteral(resourceName: "nav_services"),#imageLiteral(resourceName: "nav_facilities"),#imageLiteral(resourceName: "nav_gallery"), #imageLiteral(resourceName: "nav_share_app"),#imageLiteral(resourceName: "nav_contact_us")]
    
    var titles = ["HOME", "ABOUT US", "SERVICES", "FACILITIES", "GALLERY", "SHARE APP", "CONTACT US"]
    
    
    override init(nibName nibNameOrNil: String?,
                  bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil,
                   bundle: nibBundleOrNil)
    }
    
    required internal init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let relative = TGLinearLayout(.vert)
        relative.tg_width.equal(270)
        relative.tg_height.equal(UIScreen.main.bounds.height)
        let header = getUIImageView(sizeX: 270 , sizeY: 180)
        header.image = getUIImage(image: "nav_samir_abbas.png", resizeX: 270, resizeY: 180)
        relative.addSubview(header)
        view.addSubview(relative)
        
        let list = UITableView()
        list.tg_top.equal(10)
        list.tg_width.equal(270)
        list.tg_height.equal(UIScreen.main.bounds.height)
        list.separatorColor = Style.Transparent
        list.backgroundColor = .white
        list.allowsSelection = false
        list.rowHeight = 56
        list.register(MenuCell.self, forCellReuseIdentifier: "cell")
        list.dataSource = self
        list.delegate = self
        relative.backgroundColor = .white
        relative.addSubview(list)
    }
    
    func getUIImage(image : String, resizeX : CGFloat, resizeY : CGFloat) -> UIImage{
        var left = UIImage(named: image)
        left = left?.resize(toHeight: resizeX)
        left = left?.resize(toWidth: resizeY)
        return left!
    }
    
    func getUIImageView(sizeX : Int, sizeY : Int) -> UIImageView{
        let image = UIImageView()
        image.tg_width.equal(sizeX)
        image.tg_height.equal(sizeY)
        //image.tg_centerX.equal(0)
        image.tg_centerY.equal(0)
        return image
    }
    
    //the method returning each cell of the list
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var cell:MenuCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MenuCell
        if(indexPath.row != 5 || indexPath.row != 6){
            cell.routeName.text = titles[indexPath.row]
            cell.icon.image = images[indexPath.row]
        }else{
            cell.icon.tintColor = Style.Transparent
        }
        return cell
    }
    
    //the method returning size of the list
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
}

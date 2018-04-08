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

class BookAppointmentVC : BaseVC, UITableViewDataSource, UITableViewDelegate {
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        let relative = TGLinearLayout(.vert)
        relative.tg_width.equal(UIScreen.main.bounds.width)
        relative.tg_height.equal(UIScreen.main.bounds.height)
        
        relative.addSubview(getToolbar(title: "Find & Book", isBackMenu: true, addSpinner : false))
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
        
        let search = DTTextField()
        search.tg_width.equal(UIScreen.main.bounds.width - 40)
        search.tg_height.equal(48)
        search.tg_top.equal(20)
        search.placeholder = "Search a doctor"
        search.textAlignment = .center
        search.floatPlaceholderColor = Style.AccentColor
        search.floatPlaceholderActiveColor = Style.AccentColor
        search.cornerRadiusPreset = CornerRadiusPreset.cornerRadius1
        search.tg_centerX.equal(0)
        relative.addSubview(search)
        
        
        let bookLabel = UILabel()
        bookLabel.tg_width.equal(.wrap)
        bookLabel.tg_height.equal(.wrap)
        bookLabel.text = "Or"
        bookLabel.tg_centerX.equal(0)
        bookLabel.tg_top.equal(8)
        bookLabel.textColor = Style.TextColor
        
        relative.addSubview(bookLabel)
        
        let chooseLabel = UILabel()
        chooseLabel.tg_width.equal(UIScreen.main.bounds.width)
        chooseLabel.tg_height.equal(48)
        chooseLabel.text = "Choose Speciality"
        chooseLabel.tg_centerX.equal(0)
        chooseLabel.textAlignment = .center
        chooseLabel.tg_top.equal(8)
        chooseLabel.textColor = Style.TextColor
        chooseLabel.backgroundColor = .white
        relative.addSubview(chooseLabel)
        
        let list = UITableView()
        list.tg_width.equal(UIScreen.main.bounds.width)
        list.tg_height.equal(UIScreen.main.bounds.height)
        list.separatorColor = Style.Transparent
        list.backgroundColor = Style.BackgroundColor
        list.tg_left.equal(20)
        list.tg_right.equal(20)
        list.allowsSelection = false
        list.rowHeight = 60
        list.tg_top.equal(30)
        
        list.register(SpecialityCell.self, forCellReuseIdentifier: "cell")
        list.dataSource = self
        list.delegate = self
        
        relative.addSubview(list)
        
    }
    
    @objc
    func onBackPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    //the method returning each cell of the list
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var cell:SpecialityCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SpecialityCell
        cell.routeName.text = "Hi"
        return cell
    }
    
    //the method returning size of the list
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
}

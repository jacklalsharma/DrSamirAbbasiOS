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

class SearchDoctorVC : BaseVC {
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        let master = TGRelativeLayout()
        master.tg_width.equal(UIScreen.main.bounds.width)
        master.tg_height.equal(UIScreen.main.bounds.height)
        
        let relative = TGLinearLayout(.vert)
        relative.tg_width.equal(UIScreen.main.bounds.width)
        relative.tg_height.equal(UIScreen.main.bounds.height)
        
        relative.addSubview(getToolbar(title: "Find & Book", isBackMenu: true, addSpinner : true))
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
        
        let drop = UIDropDown(frame: CGRect(x: 50, y: 0, width: 200, height: Style.Height48))
        drop.center = CGPoint(x: self.view.frame.midX, y: self.view.frame.midY)
        drop.placeholder = "Select your country..."
        drop.options = ["Mexico", "USA", "England", "France", "Germany", "Spain", "Italy", "Canada"]
        drop.didSelect { (option, index) in
            //self.label.text = "You just select \(option) at index: \(index)"
            print("You just select: \(option) at index: \(index)")
            
        }
        drop.borderColor2 = Style.Transparent
        
        master.addSubview(drop)
        
    }
    
    @objc
    func onBackPressed(){
        self.dismiss(animated: true, completion: nil)
    }
}

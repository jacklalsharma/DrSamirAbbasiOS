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


class TimeSlotVC : BaseVC {
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        let relative = TGLinearLayout(.vert)
        relative.tg_width.equal(UIScreen.main.bounds.width)
        relative.tg_height.equal(UIScreen.main.bounds.height)
        
        relative.addSubview(getToolbar(title: "Select a time slot", isBackMenu: true, addSpinner : false))
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
        
        relative.addSubview(strip)
        
        //Doctors Info...
        let doctorLayout = TGRelativeLayout()
        doctorLayout.tg_width.equal(UIScreen.main.bounds.width)
        doctorLayout.tg_height.equal(.wrap)
        doctorLayout.backgroundColor = .white
        doctorLayout.tg_top.equal(30)
        doctorLayout.addSubview(getUILabel(text: "MBBS"))
        
        var image2 = UIImage(named: "blank_profile.png")
        image2 = image?.resize(toHeight: 60)
        image2 = image?.resize(toWidth: 60)
        
        relative.addSubview(doctorLayout)
        
    }
    
    @objc
    func onBackPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func getUILabel(text : String) -> UILabel{
        let label = UILabel()
        label.tg_width.equal(.wrap)
        label.tg_height.equal(.wrap)
        label.textColor = Style.TextColor
        label.text = text
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
}

//
//  ConfirmationCV.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 21/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import TangramKit
import Material

class ConfirmationVC : BaseVC{
    
    var id : String!
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        let linear = TGLinearLayout(.vert)
        linear.tg_width.equal(UIScreen.main.bounds.width)
        linear.tg_height.equal(Style.ScreenHeight)
        linear.backgroundColor = Style.BackgroundColor
        linear.addSubview(getToolbar(title: "Confirmation", isBackMenu: true, addSpinner : false))
        var image = UIImage(named: "strip.png")
        image = image?.resize(toHeight: 3)
        image = image?.resize(toWidth: UIScreen.main.bounds.width)
        
        let strip = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 3))
        strip.image = image
        strip.contentMode = UIViewContentMode.scaleAspectFill
        strip.tg_top.equal(8)
        //....
        
        linear.addSubview(strip)
        view.backgroundColor = Style.BackgroundColor
        
        let banner = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Style.ScreenHeight / 3.8))
        banner.image = #imageLiteral(resourceName: "contact_us_samir_abbas2-1")
        banner.contentMode = UIViewContentMode.scaleAspectFill
        banner.tg_top.equal(Style.Height48)
        view.backgroundColor = Style.BackgroundColor
        linear.addSubview(banner)
        
        view.addSubview(linear)
        menuButton.addTarget(self, action: #selector(onBackPressed), for: .touchUpInside)
    }
    
    @objc
    func onBackPressed(){
        
    }
}

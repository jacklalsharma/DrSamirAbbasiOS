//
//  NavigationVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 08/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import Material
import TangramKit


class NavigationVC : BaseVC {
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        let relative = TGRelativeLayout()
        relative.tg_width.equal(UIScreen.main.bounds.width)
        relative.tg_height.equal(UIScreen.main.bounds.height)

        relative.addSubview(getToolbar(title: "HOME", isBackMenu: false))
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        //relative.tg_top.equal(statusBarHeight)
        view.addSubview(relative)
    }
    
}

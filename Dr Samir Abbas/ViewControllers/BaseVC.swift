//
//  BaseVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 07/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import UIKit
import Material
import  TangramKit

class BaseVC : UIViewController{
    var menuButton: IconButton!
    
    func getToolbar(title : String, isBackMenu : Bool, isMarginBottom : Bool = false) -> Card{
        if(isBackMenu == true){
            menuButton = IconButton(image: Icon.cm.arrowBack, tintColor: Color.grey.base)
        }else{
            menuButton = IconButton(image: Icon.cm.menu, tintColor: Color.grey.base)
        }
        
        let toolbar = Toolbar(leftViews: [menuButton])
        toolbar.title = title
        toolbar.titleLabel.textColor = Style.AccentColor
        toolbar.titleLabel.textAlignment = .left
        toolbar.tg_height.equal(45)
        toolbar.tg_width.equal(Screen.bounds.width)
        toolbar.detail = ""
        toolbar.detailLabel.textAlignment = .left
        toolbar.detailLabel.textColor = Color.grey.base
        //toolbar.tg_top.equal(5)
        
        let card = Card()
        card.tg_width.equal(Screen.bounds.width)
        card.tg_height.equal(45)
        card.borderColor = .red
        card.toolbar = toolbar
        card.toolbarEdgeInsetsPreset = .square3
        card.toolbarEdgeInsets.bottom = 5
        card.toolbarEdgeInsets.right = 8
        card.toolbarEdgeInsets.left = 0
        //
        if(isMarginBottom){
            //card.tg_top.equal(8)
            card.tg_bottom.equal(8)
        }
        return card;
    }
    

}

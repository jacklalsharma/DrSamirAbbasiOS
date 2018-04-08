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
        var image = UIImage(named: "ic_nav.png")
        image = image?.resize(toHeight: 30)
        image = image?.resize(toWidth: 30)
        
        if(isBackMenu == true){
            image = UIImage(named: "ic_back_arrow.png")
            image = image?.resize(toHeight: 30)
            image = image?.resize(toWidth: 30)
            menuButton = IconButton(image: image, tintColor: Style.Transparent)
        }else{
            menuButton = IconButton(image: image, tintColor: Style.Transparent)
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

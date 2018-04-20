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
    var Spinner : LBZSpinner!
    var notification : IconButton!
    func getToolbar(title : String, isBackMenu : Bool, isMarginBottom : Bool = false, addSpinner : Bool = false
        , showNotification : Bool = false) -> Card{
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
        if(addSpinner == true){
            //toolbar.addSubview(getSpinner())
            toolbar.title = ""
        }
        
        if(showNotification == true){
            var image = UIImage(named: "ic_notification.png")
            image = image?.resize(toHeight: 40)
            image = image?.resize(toWidth: 40)
            notification = IconButton(image: image, tintColor: Style.Transparent)
            toolbar.rightViews.append(notification)
        }
        
        let card = Card()
        card.tg_width.equal(Screen.bounds.width)
        card.tg_height.equal(45)
        card.borderColor = .red
        card.toolbar = toolbar
        card.toolbarEdgeInsetsPreset = .square3
        card.toolbarEdgeInsets.bottom = 5
        card.toolbarEdgeInsets.right = 0
        card.toolbarEdgeInsets.left = 0
        //
        if(isMarginBottom){
            //card.tg_top.equal(8)
            card.tg_bottom.equal(8)
        }
        
        return card;
    }
    
    func getSpinner() -> LBZSpinner{
        Spinner = LBZSpinner(frame: CGRect(x: 50,y: 3 ,width: UIScreen.main.bounds.width - 100 ,height: Style.Height45))
        Spinner.decoratedSpinner(Style.AccentColor, lineColor: Style.Transparent, text: "Choose value")
        Spinner.tg_centerY.equal(0)
        let listCode = ["Books","Video","Streaming","Download","Upload"]
        Spinner.updateList(listCode)
        return Spinner
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    

}

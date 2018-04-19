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

class LeftSlideMenuVC : DPBaseEmbedViewController{
    
    var images = [#imageLiteral(resourceName: "nav_home"), #imageLiteral(resourceName: "nav_about_us"),#imageLiteral(resourceName: "nav_services"),#imageLiteral(resourceName: "nav_gallery"), #imageLiteral(resourceName: "nav_share_app"),#imageLiteral(resourceName: "nav_contact_us")]
    
    var titles = ["HOME", "ABOUT US", "SERVICES", "GALLERY", "SHARE APP", "CONTACT US"]
    
    
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
        
        relative.addSubview(getMenuItem(position: 0))
        relative.addSubview(getMenuItem(position: 1))
        relative.addSubview(getMenuItem(position: 2))
        relative.addSubview(getMenuItem(position: 3))

        
        let master = TGRelativeLayout()
        master.tg_width.equal(Style.ScreenWidth)
        master.tg_height.equal(Style.ScreenHeight)
        master.addSubview(relative)
        
        
        let bottomLayout = TGLinearLayout(.vert)
        bottomLayout.tg_width.equal(Style.ScreenWidth)
        bottomLayout.tg_height.equal(.wrap)
        
        let shareBtn = getMenuItem(position: 4)
        bottomLayout.addSubview(shareBtn)
        bottomLayout.addSubview(getMenuItem(position: 5))
        master.addSubview(bottomLayout)
        
        bottomLayout.tg_top.equal(Style.ScreenHeight / 1.2)
        
        view.addSubview(master)

        
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
    
    
    func getMenuItem(position : Int)->TGLinearLayout{
        var routeName: UILabel!
        var icon : UIImageView!
        
        let main = TGRelativeLayout()
        main.tg_width.equal(270)
        main.tg_height.equal(.wrap)
        let flat = FlatButton(title: "", titleColor: .white)
        flat.tg_width.equal(270)
        flat.tg_height.equal(Style.Height48)
        flat.tg_centerX.equal(0)
        flat.tg_centerY.equal(0)
        flat.backgroundColor = .white
        main.addSubview(flat)
        
        routeName = getUILabel(text: titles[position], size: Style.TextSize18, textColor: Style.AccentColor) // not sure how to refer to the cell size here
        routeName.tg_width.equal(.wrap)
        routeName.tg_height.equal(.wrap)
        routeName.tg_centerY.equal(0)
        routeName.tg_left.equal(Style.Width80)
        icon = getUIImageView(sizeX: Int(Style.Height30), sizeY: Int(Style.Height30))
        icon.tg_left.equal(Style.Height30)
        icon.image = images[position]
        
        main.addSubview(routeName)
        main.addSubview(icon)
        
        let linear = TGLinearLayout(.vert)
        linear.tg_width.equal(270)
        linear.tg_height.equal(Style.Height50)
        linear.addSubview(main)
        
        let strip = getUIImageView(sizeX: 270, sizeY: 2)
        strip.image = #imageLiteral(resourceName: "nav_strip")
        
        linear.addSubview(strip)
        
        main.backgroundColor = .white
        
        let master = TGLinearLayout(.vert)
        master.tg_width.equal(270)
        master.tg_height.equal(.wrap)
        master.addSubview(main)
        master.addSubview(strip)
        flat.tag = position
        flat.addTarget(self, action: #selector(openItems(sender:)), for: .touchUpInside)
        return master
    }
    
    
    func getUILabel(text : String, size : CGFloat, textColor : UIColor) -> UILabel{
        let label = UILabel()
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: size)]
        let attributedString = NSMutableAttributedString(string: text, attributes:attrs)
        label.tg_width.equal(.wrap)
        label.tg_height.equal(.wrap)
        label.textColor = textColor
        label.attributedText = attributedString
        return label
    }
    
    @objc
    func openItems(sender : UIButton){
        self.closeLeft()

        if(sender.tag == 0){
            
        }else if(sender.tag == 1){
            present(AboutUsVC(), animated: true, completion: nil)
        }else if(sender.tag == 2){
            present(ServicesListVC(), animated: true, completion: nil)
        }else if(sender.tag == 3){
            let gal = GalleryVC()
            present(gal, animated: true, completion: nil)
        }else if(sender.tag == 4){
            //Share app...
            
        }else if(sender.tag == 5){
            present(ContactUsVC(), animated: true, completion: nil)
        }
    }
    
    
}

//
//  SectionFactory.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 21/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//


import UIKit
import Material
import TangramKit

extension Section {
    
    static func sectionOne(view: UIView) -> Section {
        let viewOfSection = getRow()
        //viewOfSection.backgroundColor = UIColor.blue
        let section = Section()
        section.view = viewOfSection
        //section.headerView = getRow()
        //section.title = "Facebook"
        // individual background color for a specific section, overrides the general color if set
        //section.backgroundColor = UIColor.red
        //section.appearance.headerHeight = 100
        
        let overlayViewSection = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 49))
        overlayViewSection.backgroundColor = UIColor.white
        //overlayViewSection.image = UIImage(named: "facebook")
        overlayViewSection.contentMode = .center
        overlayViewSection.backgroundColor = UIColor.clear
        section.overlayView = overlayViewSection
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        button.setTitle("I can be any kind of UIView", for: .normal)
        viewOfSection.addSubview(button)
        
        return section
    }
    
    static func sectionTwo(view: UIView) -> Section {
        let viewOfSection = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300))
        viewOfSection.backgroundColor = UIColor.red
        let section = Section()
        section.view = viewOfSection
        section.title = "Twitter"
        // individual background color for a specific section, overrides the general color if set
        section.backgroundColor = UIColor.blue
        
        let overlayViewSection = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 49))
        overlayViewSection.backgroundColor = UIColor.white
        overlayViewSection.image = UIImage(named: "twitter")
        overlayViewSection.contentMode = .center
        overlayViewSection.backgroundColor = UIColor.clear
        section.overlayView = overlayViewSection
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        button.setTitle("I'm another UIView", for: .normal)
        viewOfSection.addSubview(button)
        
        return section
    }
    
    static func getRow() -> TGRelativeLayout{
        var routeName: UILabel!
        var firstLetter : UILabel!
        var button : FlatButton!
        
        let main = TGRelativeLayout()
        main.tg_centerX.equal(0)
        main.tg_width.equal(UIScreen.main.bounds.width - 40)
        main.tg_height.equal(.wrap)
        
        button = FlatButton(title: "", titleColor: .white)
        button.tg_width.equal(UIScreen.main.bounds.width - 40)
        button.tg_height.equal(Style.Height48)
        button.tg_centerX.equal(0)
        button.tg_centerY.equal(0)
        
        
        button.backgroundColor = .white
        main.addSubview(button)
        
        routeName = UILabel() // not sure how to refer to the cell size here
        routeName.tg_width.equal(.wrap)
        routeName.tg_height.equal(.wrap)
        routeName.tg_centerY.equal(0)
        routeName.tg_left.equal(Style.Width60)
        //routeName.tg_centerX.equal(0)
        
        firstLetter = UILabel() // not sure how to refer to the cell size here
        firstLetter.tg_width.equal(.wrap)
        firstLetter.tg_height.equal(.wrap)
        firstLetter.tg_centerY.equal(0)
        firstLetter.text = "A"
        firstLetter.layer.cornerRadius = firstLetter.frame.height / 2
        firstLetter.layer.masksToBounds = true
        firstLetter.tg_centerX.equal(0)
        firstLetter.textColor = .white
        routeName.textColor = Style.TextColor
        
        let circle = UIView()
        circle.tg_height.equal(Style.Height30)
        circle.tg_width.equal(Style.Height30)
        circle.backgroundColor = UIColor().HexToColor(hexString: "#70d8cf")
        circle.tg_centerX.equal(0)
        circle.tg_centerY.equal(0)
        circle.layer.cornerRadius = Style.Height30 / 2
        
        let firstLayout = TGRelativeLayout()
        firstLayout.tg_width.equal(Style.Height48)
        firstLayout.tg_height.equal(Style.Height48)
        firstLayout.addSubview(circle)
        firstLayout.addSubview(firstLetter)
        firstLayout.backgroundColor = UIColor().HexToColor(hexString: "#edf1f2")
        
        main.addSubview(firstLayout)
        main.addSubview(routeName)
        
        let banner = UIImageView()
        banner.tg_width.equal(UIScreen.main.bounds.width)
        banner.tg_height.equal(180)
        banner.image = #imageLiteral(resourceName: "women")
        main.addSubview(banner)
        banner.isHidden = true
        main.backgroundColor = Style.BackgroundColor
        main.borderColor = UIColor.gray
        main.tg_topBorderline = TGBorderline.init(color: UIColor.gray)
        main.tg_bottomBorderline = TGBorderline.init(color: UIColor.gray)
        main.tg_leftBorderline = TGBorderline.init(color: UIColor.gray)
        main.tg_rightBorderline = TGBorderline.init(color: UIColor.gray)
        
        return main
        
    }
    
}

//
//  ServicesCell.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 15/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import UIKit
import TangramKit
import Material

class ServicesCell :UITableViewCell {
    
    var routeName: UILabel!
    var firstLetter : UILabel!
    var button : FlatButton!
    var banner : UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
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
        contentView.addSubview(main)
        main.backgroundColor = Style.BackgroundColor
        contentView.backgroundColor = Style.BackgroundColor
        main.borderColor = UIColor.gray
        main.tg_topBorderline = TGBorderline.init(color: UIColor.gray)
        main.tg_bottomBorderline = TGBorderline.init(color: UIColor.gray)
        main.tg_leftBorderline = TGBorderline.init(color: UIColor.gray)
        main.tg_rightBorderline = TGBorderline.init(color: UIColor.gray)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func getUIImageView(sizeX : Int, sizeY : Int) -> UIImageView{
        let image = UIImageView()
        image.tg_width.equal(sizeX)
        image.tg_height.equal(sizeY)
        //image.tg_centerX.equal(0)
        image.tg_centerY.equal(0)
        return image
    }
}


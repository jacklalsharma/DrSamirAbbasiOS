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
    var headingImage : UIImageView!
    var desc : UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let main = TGRelativeLayout()
        main.tg_width.equal(UIScreen.main.bounds.width - 40)
        main.tg_height.equal(.wrap)
        main.tg_centerX.equal(0)
        
        //var padTop = UIScreen.main.bounds.height / 4 + CGFloat(position * 10) + CGFloat(position + 1) * (Style.Height48 + UIScreen.main.bounds.height / 4 )
        
        
        
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
        firstLayout.backgroundColor = .white
        
        main.addSubview(firstLayout)
        main.addSubview(routeName)
        
        headingImage = UIImageView()
        headingImage.tg_width.equal(UIScreen.main.bounds.width - 40)
        headingImage.tg_height.equal(UIScreen.main.bounds.height / 4)
        //headingImage.image = images[position]
        //main.addSubview(headingImage)
        
        
        main.backgroundColor = Style.BackgroundColor
        main.borderColor = UIColor.gray
        main.tg_topBorderline = TGBorderline.init(color: UIColor.gray)
        main.tg_bottomBorderline = TGBorderline.init(color: UIColor.gray)
        main.tg_leftBorderline = TGBorderline.init(color: UIColor.gray)
        main.tg_rightBorderline = TGBorderline.init(color: UIColor.gray)
        
        let master = TGLinearLayout(.vert)
        master.tg_width.equal(Style.ScreenWidth - 40)
        master.tg_height.equal(.wrap)
        master.addSubview(main)
        master.tg_centerX.equal(0)
        
        master.addSubview(headingImage)
        
        desc = getUILabel(text: "", size: Style.TextSize14, textColor: Style.TextColor)
        desc.tg_top.equal(5)
        desc.sizeToFit()
        master.addSubview(desc)
        contentView.addSubview(master)
    }
    
    func getUILabel(text : String, size : CGFloat, textColor : UIColor) -> UILabel{
        let label = UILabel()
        let attrs = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: size)]
        let attributedString = NSMutableAttributedString(string: text, attributes:attrs)
        label.tg_width.equal(UIScreen.main.bounds.width - 40)
        label.tg_height.equal(.wrap)
        label.textColor = textColor
        label.textAlignment = .center
        label.attributedText = attributedString
        return label
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


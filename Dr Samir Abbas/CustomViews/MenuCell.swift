//
//  MenuCell.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 09/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import UIKit
import TangramKit
import Material

class MenuCell :UITableViewCell {
    
    var routeName: UILabel!
    var icon : UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let main = TGRelativeLayout()
        main.tg_width.equal(270)
        main.tg_height.equal(Style.Height48)
        let flat = FlatButton(title: "", titleColor: .white)
        flat.tg_width.equal(270)
        flat.tg_height.equal(Style.Height48)
        flat.tg_centerX.equal(0)
        flat.tg_centerY.equal(0)
        flat.backgroundColor = .white
        main.addSubview(flat)

        routeName = getUILabel(text: "", size: 15, textColor: Style.AccentColor) // not sure how to refer to the cell size here
        routeName.tg_width.equal(.wrap)
        routeName.tg_height.equal(.wrap)
        routeName.tg_centerY.equal(0)
        routeName.tg_left.equal(Style.Width80)
        icon = getUIImageView(sizeX: 30, sizeY: 30)
        icon.tg_left.equal(30)
        
        main.addSubview(routeName)
        main.addSubview(icon)
        
        let linear = TGLinearLayout(.vert)
        linear.tg_width.equal(270)
        linear.tg_height.equal(Style.Height50)
        linear.addSubview(main)
        
        let strip = getUIImageView(sizeX: 270, sizeY: 2)
        strip.image = #imageLiteral(resourceName: "nav_strip")
        
        linear.addSubview(strip)
        contentView.addSubview(linear)

        main.backgroundColor = .white
        contentView.backgroundColor = .white
        
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
    
}

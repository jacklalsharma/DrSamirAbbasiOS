//
//  SpecialityCell.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 08/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import UIKit
import TangramKit
import Material

class SpecialityCell :UITableViewCell {
    
    var routeName: UILabel!
    var firstLetter : UILabel!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let main = TGRelativeLayout()
        main.tg_width.equal(UIScreen.main.bounds.width - 40)
        main.tg_height.equal(Style.Height48)
        let flat = FlatButton(title: "", titleColor: .white)
        flat.tg_width.equal(UIScreen.main.bounds.width - 40)
        flat.tg_height.equal(Style.Height48)
        flat.tg_centerX.equal(0)
        flat.tg_centerY.equal(0)
        
        
        flat.backgroundColor = .white
        main.addSubview(flat)
        
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
        routeName.textColor = Style.TextColor
        
        let firstLayout = TGRelativeLayout()
        firstLayout.tg_width.equal(Style.Height48)
        firstLayout.tg_height.equal(Style.Height48)
        firstLayout.addSubview(firstLetter)
        firstLayout.backgroundColor = UIColor.lightGray
        
        main.addSubview(firstLayout)
        main.addSubview(routeName)
        
        let arrow = getUIImageView(sizeX: 9, sizeY: 6)
        main.addSubview(arrow)
        arrow.image = #imageLiteral(resourceName: "arrow_next")
        arrow.tg_left.equal(UIScreen.main.bounds.width - 40 - 15)
        
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

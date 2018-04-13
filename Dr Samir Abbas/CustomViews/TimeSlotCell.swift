//
//  TimeSlotCell.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 12/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import UIKit
import Material
import TangramKit

class TimeSlotCell : UICollectionViewCell{
    
    var label : UILabel!
    var layoutMain : TGRelativeLayout!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override
    init(frame: CGRect) {
        super.init(frame: frame)
        
        layoutMain = TGRelativeLayout()
        layoutMain.tg_width.equal(UIScreen.main.bounds.width / 4 - 20)
        layoutMain.tg_height.equal(Style.Height20)
        
        label = UILabel()
        label.tg_height.equal(.wrap)
        label.tg_width.equal(.wrap)
        layoutMain.addSubview(label!)
        label.textAlignment = .center
        label.tg_centerX.equal(0)
        label.tg_centerY.equal(0)
        label.text = "9:20"
        label.textColor = Style.TextColor
        //label.tg_margin(20)
        layoutMain.backgroundColor = .white
        
        layoutMain.tg_topBorderline = TGBorderline.init(color: UIColor.gray)
        layoutMain.tg_leftBorderline = TGBorderline.init(color: UIColor.gray)
        layoutMain.tg_rightBorderline = TGBorderline.init(color: UIColor.gray)
        layoutMain.tg_bottomBorderline = TGBorderline.init(color: UIColor.gray)
        
        contentView.addSubview(layoutMain)
    }
    
    
}

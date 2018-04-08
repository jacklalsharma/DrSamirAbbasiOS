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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let main = TGRelativeLayout()
        main.tg_width.equal(UIScreen.main.bounds.width)
        main.tg_height.equal(48)
        let flat = FlatButton(title: "", titleColor: .white)
        flat.tg_width.equal(UIScreen.main.bounds.width)
        flat.tg_height.equal(48)
        flat.tg_centerX.equal(0)
        flat.tg_centerY.equal(0)
        flat.backgroundColor = .white
        main.addSubview(flat)
        
        routeName = UILabel(frame: CGRect(x: 0, y: 0, width: 48, height: 48)) // not sure how to refer to the cell size here
        routeName.tg_width.equal(48)
        routeName.tg_height.equal(48)
        routeName.tg_centerY.equal(0)
        routeName.tg_centerX.equal(0)
        
        routeName.textColor = Style.TextColor
        main.addSubview(routeName)
        
        contentView.addSubview(main)
        main.backgroundColor = Style.BackgroundColor
        contentView.backgroundColor = Style.BackgroundColor

    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

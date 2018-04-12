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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override
    init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = Style.AccentColor
    }
    
    
}

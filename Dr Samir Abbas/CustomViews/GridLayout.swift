//
//  GridLayout.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 12/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView {
    
    public func adaptBeautifulGrid(numberOfGridsPerRow: Int, gridLineSpace space: CGFloat) {
        let inset = UIEdgeInsets(
            top: space, left: space, bottom: space, right: space
        )
        adaptBeautifulGrid(numberOfGridsPerRow: numberOfGridsPerRow, gridLineSpace: space, sectionInset: inset)
    }
    
    public func adaptBeautifulGrid(numberOfGridsPerRow: Int, gridLineSpace space: CGFloat, sectionInset inset: UIEdgeInsets) {
        guard let layout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        guard numberOfGridsPerRow > 0 else {
            return
        }
        let isScrollDirectionVertical = layout.scrollDirection == .vertical
        var length = isScrollDirectionVertical ? self.frame.width : self.frame.height
        length -= space * CGFloat(numberOfGridsPerRow - 1)
        length -= isScrollDirectionVertical ? (inset.left + inset.right) : (inset.top + inset.bottom)
        let side = length / CGFloat(numberOfGridsPerRow)
        guard side > 0.0 else {
            return
        }
        layout.itemSize = CGSize(width: side, height: Style.Height30)
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space
        layout.sectionInset = inset
        layout.invalidateLayout()
    }
    
}

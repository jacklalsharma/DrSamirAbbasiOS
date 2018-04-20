//
//  SlotCell.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 19/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import UIKit
import TangramKit

class SlotCell : UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var heading : UILabel!;
    var myCollectionView : UICollectionView!
    var nightImage : UIImageView!
    var type : Int!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 10, bottom: 0, right: 10)
        layout.itemSize = CGSize(width: Style.Width60, height: Style.Height20)
        print("INIT")
        myCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - Style.Height25 - 40, height: 100), collectionViewLayout: layout)
        
        
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.tg_height.equal(.wrap)
        myCollectionView.register(TimeSlotCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.backgroundColor = UIColor.white
        myCollectionView.backgroundColor = UIColor().HexToColor(hexString: "#f2f0f1")
        myCollectionView.adaptBeautifulGrid(numberOfGridsPerRow: 5, gridLineSpace: 10.0)
        myCollectionView.tg_right.equal(20)
        
        
        let slotLayout = TGLinearLayout(.horz)
        slotLayout.tg_width.equal(UIScreen.main.bounds.width)
        slotLayout.tg_height.equal(.wrap)
        slotLayout.backgroundColor = UIColor().HexToColor(hexString: "#e9e7e8")
        nightImage = getUIImageView(sizeX: Int(Style.Height25), sizeY: Int(Style.Height25))
        nightImage.image = #imageLiteral(resourceName: "ic_night")
        nightImage.tg_centerY.equal(0)
        slotLayout.addSubview(nightImage)
        nightImage.tg_left.equal(15)
        nightImage.tg_right.equal(15)
        
        let timingsLayout = TGLinearLayout(.vert)
        slotLayout.addSubview(timingsLayout)
        
        timingsLayout.tg_width.equal(UIScreen.main.bounds.width - Style.Height25 - 20)
        timingsLayout.tg_height.equal(.wrap)
        heading = getUILabel(text: "Morning", size: 16, textColor: Style.TextColor);
        heading.textAlignment = .center
        heading.tg_top.equal(5)
        heading.tg_centerX.equal(0)
        timingsLayout.addSubview(heading)
        timingsLayout.backgroundColor = UIColor().HexToColor(hexString: "#f2f0f1")
        timingsLayout.addSubview(myCollectionView)
        
        let main = TGLinearLayout(.vert)
        main.tg_width.equal(Style.ScreenWidth)
        main.tg_height.equal(.wrap)
        
        main.addSubview(slotLayout)
        
        let space = UIImageView()
        space.tg_width.equal(Style.ScreenWidth)
        space.tg_height.equal(10)
        main.addSubview(space)
        
        contentView.addSubview(main)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath) as! TimeSlotCell
        //myCell.backgroundColor = UIColor.blue
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print("User tapped on item \(indexPath.row)")
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath as IndexPath) as! TimeSlotCell
        //myCell.layoutMain.backgroundColor = Style.AccentColor
        //collectionView.reloadData()
    }
    
    
    func getUIImageView(sizeX : Int, sizeY : Int) -> UIImageView{
        let image = UIImageView()
        image.tg_width.equal(sizeX)
        image.tg_height.equal(sizeY)
        image.tg_centerX.equal(0)
        image.tg_centerY.equal(0)
        return image
    }
    
    func getUILabel(text : String, size : CGFloat, textColor : UIColor) -> UILabel{
        let label = UILabel()
        let attrs = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: size)]
        let attributedString = NSMutableAttributedString(string: text, attributes:attrs)
        label.tg_width.equal(.wrap)
        label.tg_height.equal(.wrap)
        label.textColor = textColor
        label.attributedText = attributedString
        return label
    }
    
    

}

//
//  GalleryCell.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 10/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import UIKit
import TangramKit
import Material
import FSPagerView

class GalleryCell : UITableViewCell, FSPagerViewDataSource,FSPagerViewDelegate{
    
    fileprivate let imageNames = ["nav_samir_abbas.png","nav_samir_abbas.png","nav_samir_abbas.png","nav_samir_abbas.png","nav_samir_abbas.png","nav_samir_abbas.png"]
    
    let gallery = [#imageLiteral(resourceName: "samir_abbas_hospital_1"), #imageLiteral(resourceName: "samir_abbas_hospital_2"), #imageLiteral(resourceName: "samir_abbas_hospital_3"), #imageLiteral(resourceName: "samir_abbas_hospital_4")]
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let header = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Style.Height90))
        header.image = #imageLiteral(resourceName: "confirm_samir_abbas")
        header.contentMode = UIViewContentMode.scaleToFill
        
        //scrollView.tg_width.equal(UIScreen.main.bounds.width)
        //scrollView.tg_height.equal(UIScreen.main.bounds.height)
        
        
        //View Pager
        let pagerFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width,height: Style.Height250)
        let viewPager = FSPagerView(frame: pagerFrame);
        viewPager.dataSource = self
        viewPager.tg_width.equal(UIScreen.main.bounds.width)
        viewPager.tg_height.equal(Style.Height250)
        viewPager.delegate = self
        viewPager.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        viewPager.tg_centerX.equal(0)
        viewPager.tg_centerY.equal(0)
        viewPager.transformer = FSPagerViewTransformer(type: .linear)
        
        let scrollLinear = TGLinearLayout(.vert)
        scrollLinear.tg_width.equal(UIScreen.main.bounds.width)
        scrollLinear.tg_height.equal(UIScreen.main.bounds.height)
        scrollLinear.addSubview(header)
        scrollLinear.addSubview(viewPager)
        
        let info = getUILabel(text: "", size: 16, textColor: UIColor.blue)
        info.text = "FSPagerView is an elegant Screen Slide Library implemented primarily with UICollectionView. It is extremely helpful for making Banner、Product Show、Welcome/Guide Pages、Screen/ViewController Sliders."
        info.backgroundColor = .white
        info.sizeToFit()
        info.textAlignment = .center
        info.tg_top.equal(20)
        info.lineBreakMode = .byWordWrapping
        info.numberOfLines = 0
        
        
        let l1 = TGLinearLayout(.horz)
        l1.tg_width.equal(UIScreen.main.bounds.width - 40)
        l1.tg_centerX.equal(0)
        l1.tg_top.equal(10)
        l1.tg_height.equal(.wrap)
        l1.addSubview(getSquareButton(position : 0))
        l1.addSubview(getSquareButton(position : 1))
        
        
        let l2 = TGLinearLayout(.horz)
        l2.tg_width.equal(UIScreen.main.bounds.width - 40)
        l2.tg_centerX.equal(0)
        l2.tg_height.equal(.wrap)
        l2.addSubview(getSquareButton(position : 2))
        l2.addSubview(getSquareButton(position : 3))
        l2.tg_top.equal(0)
        
        scrollLinear.addSubview(info)
        scrollLinear.addSubview(l1)
        scrollLinear.addSubview(l2)
        contentView.addSubview(scrollLinear)
        
    }
    
    
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = #imageLiteral(resourceName: "nav_samir_abbas") //UIImage(named: self.imageNames[index])
        //cell.imageView?.image = cell.imageView?.image!.withRenderingMode(.alwaysTemplate)
        cell.imageView?.clipsToBounds = true
        cell.textLabel?.text = ""
        cell.imageView?.tg_centerX.equal(0)
        cell.imageView?.tg_centerY.equal(0)
        return cell
    }
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    // MARK:- FSPagerView Delegate
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        //        pagerView.deselectItem(at: index, animated: true)
        //        pagerView.scrollToItem(at: index, animated: true)
        //        self.pageControl.currentPage = index
    }
    
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        //        guard self.pageControl.currentPage != pagerView.currentIndex else {
        //            return
        //        }
        //        self.pageControl.currentPage = pagerView.currentIndex // Or Use KVO with property "currentIndex"
        //
    }
    
    func getUILabel(text : String, size : CGFloat, textColor : UIColor) -> UILabel{
        let label = UILabel()
        let attrs = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: size)]
        let attributedString = NSMutableAttributedString(string: text, attributes:attrs)
        label.tg_width.equal(UIScreen.main.bounds.width)
        label.tg_height.equal(.wrap)
        label.textColor = textColor
        label.attributedText = attributedString
        return label
    }
    
    func getSquareButton(position : Int) -> TGRelativeLayout{
        
        let bookAppt = TGRelativeLayout()
        bookAppt.tg_centerX.equal(0)
        bookAppt.tg_width.equal(UIScreen.main.bounds.width/2 - 20)
        bookAppt.tg_height.equal(Style.ScreenHeight / 6.13)
        //bookAppt.tg_backgroundImage = #imageLiteral(resourceName: "btn_outer")
        bookAppt.tg_top.equal(5)
        bookAppt.backgroundColor = .white
        bookAppt.tg_backgroundImage = gallery[position]
        bookAppt.tg_right.equal(5)
        return bookAppt
    }
    
}

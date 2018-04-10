//
//  GalleryVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 10/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import Material
import TangramKit
import FSPagerView

class GalleryVC : BaseVC, FSPagerViewDataSource,FSPagerViewDelegate {
    fileprivate let imageNames = ["nav_samir_abbas.png","nav_samir_abbas.png","nav_samir_abbas.png","nav_samir_abbas.png","nav_samir_abbas.png","nav_samir_abbas.png"]

    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        let relative = TGLinearLayout(.vert)
        relative.tg_width.equal(UIScreen.main.bounds.width)
        relative.tg_height.equal(UIScreen.main.bounds.height)
        
        relative.addSubview(getToolbar(title: "Find & Book", isBackMenu: true, addSpinner : false))
        view.addSubview(relative)
        relative.backgroundColor = Style.BackgroundColor
        
        menuButton.addTarget(self, action: #selector(onBackPressed), for: .touchUpInside)
        
        //STRIP VIEW...
        var image = UIImage(named: "strip.png")
        image = image?.resize(toHeight: 3)
        image = image?.resize(toWidth: UIScreen.main.bounds.width)
        
        let strip = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 3))
        strip.image = image
        strip.contentMode = UIViewContentMode.scaleAspectFill
        strip.tg_top.equal(8)
        relative.addSubview(strip)
        //....
        
        let header = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Style.Height90))
        header.image = #imageLiteral(resourceName: "confirm_samir_abbas")
        header.contentMode = UIViewContentMode.scaleToFill
        
        let scrollView = UIScrollView()
        scrollView.tg_width.equal(UIScreen.main.bounds.width)
        scrollView.tg_height.equal(UIScreen.main.bounds.height)

        
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
        
        let scrollLinear = TGLinearLayout(.vert)
        scrollLinear.tg_width.equal(UIScreen.main.bounds.width)
        scrollLinear.tg_height.equal(UIScreen.main.bounds.height)
        scrollLinear.addSubview(header)
        scrollLinear.addSubview(viewPager)
        
        let info = getUILabel(text: "", size: 16, textColor: UIColor.blue)
        info.text = "FSPagerView is an elegant Screen Slide Library implemented primarily with UICollectionView. It is extremely helpful for making Banner、Product Show、Welcome/Guide Pages、Screen/ViewController Sliders."
        info.backgroundColor = .white
        info.tg_top.equal(20)
        info.lineBreakMode = .byWordWrapping
        info.numberOfLines = 0
        
        scrollLinear.addSubview(info)
        scrollView.addSubview(scrollLinear)
        
        relative.addSubview(scrollView)

    }
    
    @objc
    func onBackPressed(){
        self.dismiss(animated: true, completion: nil)
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
        label.tg_width.equal(.wrap)
        label.tg_height.equal(.wrap)
        label.textColor = textColor
        label.attributedText = attributedString
        return label
    }
}

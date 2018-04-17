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

    let gallery = [#imageLiteral(resourceName: "samir_abbas_hospital_1"), #imageLiteral(resourceName: "samir_abbas_hospital_2"), #imageLiteral(resourceName: "samir_abbas_hospital_3"), #imageLiteral(resourceName: "samir_abbas_hospital_4")]
    
    var scrollView : UIScrollView!
//    override
//    func viewDidLoad() {
//        super.viewDidLoad()
//
//        let relative = TGLinearLayout(.vert)
//        relative.tg_width.equal(UIScreen.main.bounds.width)
//        relative.tg_height.equal(UIScreen.main.bounds.height)
//
//        relative.addSubview(getToolbar(title: "Gallery", isBackMenu: true, addSpinner : false))
//        relative.backgroundColor = Style.BackgroundColor
//
//        menuButton.addTarget(self, action: #selector(onBackPressed), for: .touchUpInside)
//
//        //STRIP VIEW...
//        var image = UIImage(named: "strip.png")
//        image = image?.resize(toHeight: 3)
//        image = image?.resize(toWidth: UIScreen.main.bounds.width)
//
//        let strip = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 3))
//        strip.image = image
//        strip.contentMode = UIViewContentMode.scaleAspectFill
//        strip.tg_top.equal(8)
//        relative.addSubview(strip)
//        //....
//
//        let header = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Style.Height90))
//        header.image = #imageLiteral(resourceName: "confirm_samir_abbas")
//        header.contentMode = UIViewContentMode.scaleToFill
//
//        scrollView = UIScrollView(frame: UIScreen.main.bounds)
//        //scrollView.tg_width.equal(UIScreen.main.bounds.width)
//        //scrollView.tg_height.equal(UIScreen.main.bounds.height)
//
//
//        //View Pager
//        let pagerFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width,height: Style.Height250)
//        let viewPager = FSPagerView(frame: pagerFrame);
//        viewPager.dataSource = self
//        viewPager.tg_width.equal(UIScreen.main.bounds.width)
//        viewPager.tg_height.equal(Style.Height250)
//        viewPager.delegate = self
//        viewPager.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
//        viewPager.tg_centerX.equal(0)
//        viewPager.tg_centerY.equal(0)
//        viewPager.transformer = FSPagerViewTransformer(type: .linear)
//
//        let scrollLinear = TGLinearLayout(.vert)
//        scrollLinear.tg_width.equal(UIScreen.main.bounds.width)
//        scrollLinear.tg_height.equal(UIScreen.main.bounds.height)
//        scrollLinear.addSubview(header)
//        scrollLinear.addSubview(viewPager)
//
//        let info = getUILabel(text: "", size: 16, textColor: UIColor.blue)
//        info.text = "FSPagerView is an elegant Screen Slide Library implemented primarily with UICollectionView. It is extremely helpful for making Banner、Product Show、Welcome/Guide Pages、Screen/ViewController Sliders."
//        info.backgroundColor = .white
//        info.sizeToFit()
//        info.textAlignment = .center
//        info.tg_top.equal(20)
//        info.lineBreakMode = .byWordWrapping
//        info.numberOfLines = 0
//
//
//        let l1 = TGLinearLayout(.horz)
//        l1.tg_width.equal(UIScreen.main.bounds.width - 40)
//        l1.tg_centerX.equal(0)
//        l1.tg_top.equal(10)
//        l1.tg_height.equal(.wrap)
//        l1.addSubview(getSquareButton(position : 0))
//        l1.addSubview(getSquareButton(position : 1))
//
//
//        let l2 = TGLinearLayout(.horz)
//        l2.tg_width.equal(UIScreen.main.bounds.width - 40)
//        l2.tg_centerX.equal(0)
//        l2.tg_height.equal(.wrap)
//        l2.addSubview(getSquareButton(position : 2))
//        l2.addSubview(getSquareButton(position : 3))
//        l2.tg_top.equal(0)
//
//        scrollLinear.addSubview(info)
//        scrollLinear.addSubview(l1)
//        scrollLinear.addSubview(l2)
//        scrollView.addSubview(scrollLinear)
//
//        relative.addSubview(scrollView)
//        view.addSubview(relative)
//
//    }
    
    let labelOne: UILabel = {
        let label = UILabel()
        label.text = "Scroll Top"
        label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelTwo: UILabel = {
        let label = UILabel()
        label.text = "Scroll Bottom"
        label.backgroundColor = .green
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        let screensize: CGRect = UIScreen.main.bounds
        let screenWidth = screensize.width
        let screenHeight = screensize.height
        var scrollView: UIScrollView!
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        
        let insideLayout = TGLinearLayout(.vert)
        insideLayout.tg_width.equal(UIScreen.main.bounds.width)
        insideLayout.tg_height.equal(.wrap)
        
        
        
        let viewPager = ViewPager()
        viewPager.tg_width.equal(UIScreen.main.bounds.width)
        viewPager.tg_height.equal(UIScreen.main.bounds.height / 4.6)
        viewPager.dataSource = self;
        viewPager.pageControl.isHidden = true
        
        
        
        for i in 0 ..< 20{
            let header = UIImageView(frame: CGRect(x: 0, y: CGFloat(i) * Style.Height90, width: UIScreen.main.bounds.width, height: Style.Height90))
            header.image = #imageLiteral(resourceName: "confirm_samir_abbas")
            header.contentMode = UIViewContentMode.scaleToFill
            scrollView.addSubview(header)
            
            NSLayoutConstraint(item: header, attribute: .leading, relatedBy: .equal, toItem: scrollView, attribute: .leadingMargin, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: header, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
            NSLayoutConstraint(item: header, attribute: .top, relatedBy: .equal, toItem: scrollView, attribute: .topMargin, multiplier: 1, constant: 10).isActive = true
            NSLayoutConstraint(item: header, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30).isActive = true
            
        }
        
        
        
        scrollView.contentSize = CGSize(width: screenWidth, height: 2000)
        
        let linear = TGLinearLayout(.vert)
        linear.tg_width.equal(UIScreen.main.bounds.width)
        linear.tg_height.equal(UIScreen.main.bounds.height)
        linear.backgroundColor = Style.BackgroundColor
        linear.addSubview(getToolbar(title: "Gallery", isBackMenu: true, addSpinner : false))
        var image = UIImage(named: "strip.png")
        image = image?.resize(toHeight: 3)
        image = image?.resize(toWidth: UIScreen.main.bounds.width)
        
        let strip = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 3))
        strip.image = image
        strip.contentMode = UIViewContentMode.scaleAspectFill
        strip.tg_top.equal(8)
        //....
        
        
        
        linear.addSubview(strip)
        linear.addSubview(scrollView)
        view.addSubview(linear)
        //view.addSubview()
        view.backgroundColor = Style.BackgroundColor
        menuButton.addTarget(self, action: #selector(onBackPressed), for: .touchUpInside)
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


extension GalleryVC :ViewPagerDataSource{
    
    func numberOfItems(viewPager:ViewPager) -> Int {
        return 4;
    }
    
    func viewAtIndex(viewPager:ViewPager, index:Int, view:UIView?) -> UIView {
        //view = UIView();
        var newView = view;
        var label:UIImageView?
        if(newView == nil){
            newView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height / 4.6))
            
            label = UIImageView(frame: newView!.bounds)
            label?.contentMode = UIViewContentMode.scaleToFill
            if(index == 0){
                label?.image = #imageLiteral(resourceName: "banner")
            }else if(index == 1){
                label?.image = #imageLiteral(resourceName: "banner1")
            }else if(index == 2){
                label?.image = #imageLiteral(resourceName: "banner2")
            }else if(index == 3){
                label?.image = #imageLiteral(resourceName: "banner4")
            }
            
            //label!.font =  label!.font.withSizewithSize(28)
            newView?.addSubview(label!)
        }else{
            label = newView?.viewWithTag(1) as? UIImageView
        }
        
        //label?.text = "Page View Pager  \(index+1)"
        
        return newView!
    }
}

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
import MGRelativeKit

class GalleryVC : BaseVC{

    let gallery = [#imageLiteral(resourceName: "sameer_abbas_gallery_1_1"), #imageLiteral(resourceName: "sameer_abbas_gallery_2_2"), #imageLiteral(resourceName: "sameer_abbas_gallery_3_3"), #imageLiteral(resourceName: "sameer_abbas_gallery_4_4"), #imageLiteral(resourceName: "sameer_abbas_gallery_5_5"), #imageLiteral(resourceName: "sameer_abbas_gallery_6_6"), #imageLiteral(resourceName: "sameer_abbas_gallery_7_7"), #imageLiteral(resourceName: "sameer_abbas_gallery_8_8")]
    
    var scrollHeight : CGFloat!
    
    var viewPager : ViewPager!
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        scrollHeight = 0
        
        
        
        let linear = TGLinearLayout(.vert)
        linear.tg_width.equal(UIScreen.main.bounds.width)
        linear.tg_height.equal(.wrap)
        linear.backgroundColor = Style.BackgroundColor
        linear.addSubview(getToolbar(title: "gallery".localizedString, isBackMenu: true, addSpinner : false))
        var image = UIImage(named: "strip.png")
        image = image?.resize(toHeight: 3)
        image = image?.resize(toWidth: UIScreen.main.bounds.width)
        
        let strip = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 3))
        strip.image = image
        strip.contentMode = UIViewContentMode.scaleAspectFill
        strip.tg_top.equal(8)
        //....
        
        linear.addSubview(strip)
        view.backgroundColor = Style.BackgroundColor
        
        let banner = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Style.Height80))
        banner.image = #imageLiteral(resourceName: "confirm_samir_abbas")
        banner.contentMode = UIViewContentMode.scaleAspectFill
        scrollHeight = scrollHeight + Style.Height80
        
        viewPager = ViewPager()
        viewPager.tg_width.equal(UIScreen.main.bounds.width)
        viewPager.tg_height.equal(UIScreen.main.bounds.height / 4)
        viewPager.dataSource = self;
        viewPager.pageControl.isHidden = true
        
        let pagerLayout = TGRelativeLayout()
        pagerLayout.tg_width.equal(UIScreen.main.bounds.width)
        pagerLayout.tg_height.equal(UIScreen.main.bounds.height / 4)
        pagerLayout.addSubview(viewPager)
        
        let left = FlatButton(image: #imageLiteral(resourceName: "left_swipe"), tintColor: Style.TextColor)
        left.tg_width.equal(Style.Height20)
        left.tg_height.equal(Style.Height20)
        left.tg_left.equal(20)
        left.tg_centerY.equal(0)
        left.addTarget(self, action: #selector(self.left), for: .touchUpInside)
        
        pagerLayout.addSubview(left)
        
        
        
        
        let right = FlatButton(image: #imageLiteral(resourceName: "right_swipe"), tintColor: Style.TextColor)
        right.tg_width.equal(Style.Height20)
        right.tg_height.equal(Style.Height20)
        right.tg_left.equal(UIScreen.main.bounds.width - 40)
        
        right.tg_centerY.equal(0)
        right.addTarget(self, action: #selector(self.right), for: .touchUpInside)
        pagerLayout.addSubview(right)

        
        
        
        scrollHeight = scrollHeight + UIScreen.main.bounds.height / 4
        
        
        
        viewPager.tg_top.equal(10)
        
        let infoLayout = LinearLayout(width : MATCH_PARENT, height : Style.Height140)
        infoLayout.margin(left: 0, right: 0, top: 20, bottom: 0)
        infoLayout.backgroundColor = .white
        let info = getUILabel(text: "gallery_desc".localizedString, size: Style.TextSize18, textColor: UIColor().HexToColor(hexString: "##3c7fd1"))
        
        
        
        
        
        scrollHeight = scrollHeight + Style.Height140
        
        let inner = LinearLayout(width : MATCH_PARENT, height : Style.Height140)
        inner.margin(left: 10, right: 10, top: 0, bottom: 0)
        info.textAlignment = .center
        inner.add(view: info, w: MATCH_PARENT, h: Style.Height140)
        infoLayout.padding(left: 0, right: 0, top: 10, bottom: 10)
        infoLayout.add(view: inner, w: MATCH_PARENT, h: Style.Height140)
        
        scrollHeight = scrollHeight + (Style.ScreenHeight / 6.13) * 4
        
        let img1 = RelativeLayout(width : MATCH_PARENT, height : Style.ScreenHeight / 6.13)
        img1.margin(left: 15, right: 5, top: 10, bottom: 0)
        img1.add(view: getSquareButton(position: 0), w : UIScreen.main.bounds.width , h : Style.ScreenHeight / 6.13)
        
        
        
        let img2 = RelativeLayout(width : MATCH_PARENT, height : Style.ScreenHeight / 6.13)
        img2.margin(left: 15, right: 5, top: 5, bottom: 0)
        img2.add(view: getSquareButton(position: 2), w : UIScreen.main.bounds.width , h : Style.ScreenHeight / 6.13)
        
        
        
        let img3 = RelativeLayout(width : MATCH_PARENT, height : Style.ScreenHeight / 6.13)
        img3.margin(left: 15, right: 5, top: 5, bottom: 0)
        img3.add(view: getSquareButton(position: 4), w : UIScreen.main.bounds.width , h : Style.ScreenHeight / 6.13)
        
        
        
        let img4 = RelativeLayout(width : MATCH_PARENT, height : Style.ScreenHeight / 6.13)
        img4.margin(left: 15, right: 5, top: 5, bottom: 0)
        img4.add(view: getSquareButton(position: 6), w : UIScreen.main.bounds.width , h : Style.ScreenHeight / 6.13)
        
        
        
        var ll = LinearLayout(width: MATCH_PARENT, height: scrollHeight).vertical()
        ll.padding(left: 0, right: 0, top: Style.Height80, bottom: 0)
        ll.add(view: banner, w: MATCH_PARENT, h: Style.Height80)
        ll.add(view: pagerLayout, w: MATCH_PARENT, h: UIScreen.main.bounds.height / 4)
        ll.add(view: infoLayout, w: MATCH_PARENT, h: Style.Height140)
        ll.add(view: img1, w: MATCH_PARENT, h: Style.ScreenHeight / 6.13)
        ll.add(view: img2, w: MATCH_PARENT, h: Style.ScreenHeight / 6.13)
        ll.add(view: img3, w: MATCH_PARENT, h: Style.ScreenHeight / 6.13)
        ll.add(view: img4, w: MATCH_PARENT, h: Style.ScreenHeight / 6.13)

        
        
        
        
        view.addSubview(ll.createScrollable())
        view.addSubview(linear)
        menuButton.addTarget(self, action: #selector(onBackPressed), for: .touchUpInside)
    }
    
    @objc
    func onBackPressed(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func getUILabel(text : String, size : CGFloat, textColor : UIColor) -> UILabel{
        let label = UILabel()
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: size)]
        let attributedString = NSMutableAttributedString(string: text, attributes:attrs)
        label.tg_width.equal(UIScreen.main.bounds.width)
        label.tg_height.equal(.wrap)
        label.textColor = textColor
        label.attributedText = attributedString
        return label
    }
    
    func getSquareButton(position : Int) -> TGLinearLayout{
        
        let bookAppt = TGLinearLayout(.horz)
        bookAppt.tg_centerX.equal(0)
        bookAppt.tg_width.equal(UIScreen.main.bounds.width)
        bookAppt.tg_height.equal(Style.ScreenHeight / 6.13)
        //bookAppt.tg_backgroundImage = #imageLiteral(resourceName: "btn_outer")
        bookAppt.tg_top.equal(5)
        
        let flat1 = FlatButton(image: gallery[position])
        flat1.tg_width.equal(UIScreen.main.bounds.width / 2)
        flat1.tg_height.equal(UIScreen.main.bounds.height / 6.13)
        flat1.tag = position
        flat1.addTarget(self, action: #selector(self.openGallery(sender:)), for: .touchUpInside)
        flat1.tg_right.equal(3)
        
        let flat2 = FlatButton(image: gallery[position + 1])
        flat2.tg_width.equal(UIScreen.main.bounds.width / 2)
        flat2.tg_height.equal(UIScreen.main.bounds.height / 6.13)
        flat2.tg_left.equal(3)
        flat2.tag = position + 1
        flat2.addTarget(self, action: #selector(self.openGallery(sender:)), for: .touchUpInside)
        bookAppt.addSubview(flat1)
        bookAppt.addSubview(flat2)
        
        return bookAppt
    }
    
    @objc
    func openGallery(sender : UIButton){
        var open = ImageViewerVC()
        open.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        open.image = gallery[sender.tag]
        present(open, animated: true, completion: nil)
    }
    
    @objc
    func left(){
        if(viewPager.currentPosition == 0){
            return
        }
        
        var page = viewPager.currentPosition;
        page = page - 1
        viewPager.scrollToPage(index: page)
    }
    
    @objc
    func right(){
        if(viewPager.currentPosition == 4){
            return
        }
        
        var page = viewPager.currentPosition;
        page = page + 1
        viewPager.scrollToPage(index: page)
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
            newView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height / 4))
            
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

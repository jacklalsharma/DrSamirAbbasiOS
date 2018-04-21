//
//  ConfirmationCV.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 21/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import TangramKit
import Material

class ConfirmationVC : BaseVC{
    
    var id : String!
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        let linear = TGLinearLayout(.vert)
        linear.tg_width.equal(UIScreen.main.bounds.width)
        linear.tg_height.equal(Style.ScreenHeight)
        linear.backgroundColor = Style.BackgroundColor
        linear.addSubview(getToolbar(title: "Confirmation", isBackMenu: true, addSpinner : false))
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
        
        let banner = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: Style.ScreenHeight / 4.5))
        banner.image = #imageLiteral(resourceName: "confirm_banner")
        banner.contentMode = UIViewContentMode.scaleAspectFill
        banner.tg_top.equal(Style.Height45 - Style.Height10)
        view.backgroundColor = Style.BackgroundColor
        linear.addSubview(banner)
        
        let banner2 = UIImageView()
        banner2.tg_width.equal(Style.ScreenWidth - 20)
        banner2.tg_height.equal(Style.Height100)
        banner2.tg_left.equal(10)
        banner2.tg_right.equal(10)
        banner2.image = #imageLiteral(resourceName: "confirm_samir_abbas")
        banner2.tg_top.equal(Style.Height45)
        linear.addSubview(banner2)
        
        
        let thanks = TGLinearLayout(.vert)
        thanks.tg_width.equal(Style.ScreenWidth - 20)
        thanks.tg_height.equal(.wrap)
        thanks.backgroundColor = .white
        thanks.tg_top.equal(Style.Height10)
        let thk = getUILabelBold(text: "Thank You", size: Style.TextSize20, textColor: Style.TextColor)
        thk.tg_top.equal(Style.Height10)
        thanks.addSubview(thk)
        thanks.tg_centerX.equal(0)
        
        let cnfrm = getUILabel(text: "Your booking has been confirmed", size: Style.TextSize16, textColor: Style.TextColor)
        cnfrm.tg_top.equal(3)
        thanks.addSubview(cnfrm)
        
        
        let saveLayout = TGRelativeLayout()
        saveLayout.tg_height.equal(Style.Height80)
        saveLayout.tg_width.equal(Style.ScreenWidth - Style.Width90 - Style.Width60)
        saveLayout.tg_backgroundImage = #imageLiteral(resourceName: "confirm_save")
        saveLayout.tg_centerX.equal(0)
        saveLayout.tg_top.equal(Style.Height20)
        thanks.addSubview(saveLayout)
        
        let left = TGLinearLayout(.vert)
        left.tg_width.equal(.wrap)
        left.tg_height.equal(.wrap)
        left.tg_centerY.equal(0)
        left.tg_left.equal(Style.Height20)
        left.addSubview(getUILabel(text: "Booking ID", size: Style.TextSize16, textColor: .white))
        left.addSubview(getBookinfButton())
        
        saveLayout.addSubview(left)
        
        let right = TGRelativeLayout()
        right.tg_width.equal(.wrap)
        right.tg_height.equal(Style.Height80)
        right.addSubview(getSaveButton())
        right.tg_left.equal(Style.ScreenWidth / 2 - Style.Height20)
        saveLayout.addSubview(right)
        
        thanks.addSubview(getUIImageView(sizeX: 5, sizeY: Int(Style.Height20)))
        
        
        linear.addSubview(thanks)
        view.addSubview(linear)
        
        
        
        
        menuButton.addTarget(self, action: #selector(onBackPressed), for: .touchUpInside)
        
        let nextBtn = nextButton()
        nextBtn.tg_centerX.equal(0)
        nextBtn.tg_top.equal(Style.ScreenHeight - Style.Height60)
        view.addSubview(nextBtn)
    }
    
    func getUIImageView(sizeX : Int, sizeY : Int) -> UIImageView{
        let image = UIImageView()
        image.tg_width.equal(sizeX)
        image.tg_height.equal(sizeY)
        image.tg_centerX.equal(0)
        image.tg_centerY.equal(0)
        return image
    }
    
    func getBookinfButton()->TGRelativeLayout{
        let main = TGRelativeLayout()
        main.tg_width.equal(.wrap)
        main.tg_height.equal(.wrap)
        //main.tg_backgroundImage = #imageLiteral(resourceName: "id")
        let label = getUILabel(text: id, size: Style.TextSize16, textColor: .white)
        label.tg_centerY.equal(0)
        let img = getUIImageView(sizeX: Int(Style.Width90 * 1.5), sizeY: Int(Style.Height30 + Style.Height10))
        img.image = #imageLiteral(resourceName: "id")
        main.addSubview(img)
        main.addSubview(label)
        main.tg_centerY.equal(0)
        return main
    }
    
    func getSaveButton()->TGRelativeLayout{
        let flat = RaisedButton(title: "", titleColor: .white)
        flat.tg_width.equal(Style.Width60)
        flat.tg_height.equal(Style.Height45)
        flat.tg_centerY.equal(0)
        flat.backgroundColor = Style.Transparent
        let main = TGRelativeLayout()
        main.tg_width.equal(Style.Width60)
        main.tg_height.equal(Style.Height45)
        let label = getUILabel(text: "SAVE", size: Style.TextSize16, textColor: .white)
        label.tg_centerY.equal(0)
        main.addSubview(label)
        main.addSubview(flat)
        main.tg_centerY.equal(0)
        flat.addTarget(self, action: #selector(saveImage), for: .touchUpInside)
        return main
    }
    
    @objc
    func saveImage(){
        //Create the UIImage
        UIGraphicsBeginImageContext(view.frame.size)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        //Save it to the camera roll
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        
    }
    
    func nextButton()->TGRelativeLayout{
        let main = TGRelativeLayout()
        let flat = RaisedButton(title: "", titleColor: .white)
        flat.tg_width.equal(Style.Width80 + Style.Width30)
        flat.tg_height.equal(Style.Height30)
        
        let text = getUILabel(text: "DONE", size: Style.TextSize18, textColor: Style.AccentColor)
        text.tg_centerX.equal(0)
        text.tg_centerY.equal(0)
        
        main.tg_width.equal(.wrap)
        main.tg_height.equal(.wrap)
        flat.addTarget(self, action: #selector(self.nextClick), for: .touchUpInside)
        main.addSubview(flat)
        main.tg_topBorderline = TGBorderline.init(color: Style.AccentColor, thick: 5, dash: 0, headIndent: 0, tailIndent: 0, offset: 0)
        main.tg_bottomBorderline = TGBorderline.init(color: Style.AccentColor, thick: 5, dash: 0, headIndent: 0, tailIndent: 0, offset: 0)
        main.tg_leftBorderline = TGBorderline.init(color: Style.AccentColor, thick: 5, dash: 0, headIndent: 0, tailIndent: 0, offset: 0)
        main.tg_rightBorderline = TGBorderline.init(color: Style.AccentColor, thick: 5, dash: 0, headIndent: 0, tailIndent: 0, offset: 0)
        //main.borderWidthPreset = TGBorderline.init(color: UIColorStyle.AccentColor, thick: 5, dash: 0, headIndent: 0, tailIndent: 0, offset: 0)
        main.addSubview(text)
        return main
    }
    
    
    func getUILabel(text : String, size : CGFloat, textColor : UIColor) -> UILabel{
        let label = UILabel()
        let attrs = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: size)]
        let attributedString = NSMutableAttributedString(string: text, attributes:attrs)
        label.tg_width.equal(.wrap)
        label.tg_height.equal(.wrap)
        label.textColor = textColor
        label.tg_centerX.equal(0)
        label.attributedText = attributedString
        return label
    }
    
    func getUILabelBold(text : String, size : CGFloat, textColor : UIColor) -> UILabel{
        let label = UILabel()
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: size)]
        let attributedString = NSMutableAttributedString(string: text, attributes:attrs)
        label.tg_width.equal(.wrap)
        label.tg_height.equal(.wrap)
        label.textColor = textColor
        label.tg_centerX.equal(0)
        label.attributedText = attributedString
        return label
    }
    
    
    @objc
    func nextClick(){
        print("HERE")
        let nav = MasterVC()
        present(nav, animated: true, completion: nil)
    }
    
    @objc
    func onBackPressed(){
        let nav = MasterVC()
        present(nav, animated: true, completion: nil)
    }
}

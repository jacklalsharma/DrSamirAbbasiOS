//
//  DialogBox.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 07/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//


import Foundation
import UIKit
import TangramKit
import NVActivityIndicatorView
import Material

class DialogBox : UIViewController{
    
    var progressDialog : Bool?
    var oneButtonDialog : Bool?
    var twoButtonDialog : Bool?
    
    var progressTitle : String?
    var progressMessage : String?
    
    var dialogTitle : String?
    var dialgoMessage : String?
    
    var leftDialogButtonText : String?
    var rightDialogButtonText : String?
    
    var okButton : RaisedButton?
    var leftButton : RaisedButton?
    var rightButton : RaisedButton?
    
    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        //Mask Color
        self.view.isOpaque = false
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        let layout = TGLinearLayout(.vert)
        layout.tg_width.equal(self.view.frame.width)
        layout.tg_height.equal(.wrap)
        layout.tg_centerX.equal(0)
        layout.tg_centerY.equal(0)
        layout.tg_top.equal(200)
        
        if(progressDialog!){
            let titleLabel: UILabel = UILabel()
            let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17)]
            let attributedString = NSMutableAttributedString(string: progressTitle!, attributes:attrs)
            titleLabel.attributedText = attributedString
            titleLabel.textColor = .white
            titleLabel.sizeToFit()
            titleLabel.tg_centerX.equal(0)
            titleLabel.tg_centerY.equal(0)
            titleLabel.tg_top.equal(0)
            
            
            let messageLabel: UILabel = UILabel()
            let attrs2 = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 15)]
            let attributedString2 = NSMutableAttributedString(string: progressMessage!, attributes:attrs2)
            messageLabel.attributedText = attributedString2
            messageLabel.textColor = .white
            messageLabel.sizeToFit()
            messageLabel.tg_centerX.equal(0)
            messageLabel.tg_top.equal(10)
            
            let loaderFrame = CGRect(x: 0, y: 0, width: 70, height: 70)
            let loader = NVActivityIndicatorView(frame: loaderFrame, type: NVActivityIndicatorType.lineScalePulseOut, color: .white, padding: 0)
            loader.tg_centerX.equal(0)
            loader.tg_top.equal(30)
            loader.startAnimating()
            
            
            layout.addSubview(titleLabel)
            layout.addSubview(messageLabel)
            layout.addSubview(loader)
        }else if(oneButtonDialog!){
            let titleLabel: UILabel = UILabel()
            let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17)]
            let attributedString = NSMutableAttributedString(string: dialogTitle!, attributes:attrs)
            titleLabel.attributedText = attributedString
            titleLabel.textColor = Style.TextColor
            titleLabel.sizeToFit()
            titleLabel.tg_centerX.equal(0)
            titleLabel.tg_centerY.equal(0)
            titleLabel.tg_top.equal(20)
            
            
            let messageLabel: UILabel = UILabel()
            let attrs2 = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 15)]
            let attributedString2 = NSMutableAttributedString(string: dialgoMessage!, attributes:attrs2)
            messageLabel.attributedText = attributedString2
            messageLabel.textColor = Style.TextColor
            messageLabel.sizeToFit()
            messageLabel.tg_centerX.equal(0)
            messageLabel.tg_top.equal(10)
            
            okButton = RaisedButton(title: leftDialogButtonText, titleColor: .white)
            okButton?.pulseColor = .white
            okButton?.backgroundColor = Style.AccentColor
            okButton?.tg_width.equal(UIScreen.main.bounds.width - 40)
            okButton?.tg_centerX.equal(0)
            okButton?.tg_height.equal(48)
            okButton?.tg_top.equal(40)
            
            layout.tg_left.equal(20)
            layout.tg_right.equal(20)
            layout.backgroundColor = .white
            layout.addSubview(titleLabel)
            layout.addSubview(messageLabel)
            layout.addSubview(okButton!)
            
        }else if(twoButtonDialog!){
            
            let titleLabel: UILabel = UILabel()
            let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17)]
            let attributedString = NSMutableAttributedString(string: dialogTitle!, attributes:attrs)
            titleLabel.attributedText = attributedString
            titleLabel.textColor = Style.TextColor
            titleLabel.sizeToFit()
            titleLabel.tg_centerX.equal(0)
            titleLabel.tg_centerY.equal(0)
            titleLabel.tg_top.equal(20)
            
            
            let messageLabel: UILabel = UILabel()
            let attrs2 = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 15)]
            let attributedString2 = NSMutableAttributedString(string: dialgoMessage!, attributes:attrs2)
            messageLabel.attributedText = attributedString2
            messageLabel.textColor = Style.TextColor
            messageLabel.sizeToFit()
            messageLabel.tg_centerX.equal(0)
            messageLabel.tg_top.equal(10)
            
            leftButton = RaisedButton(title: leftDialogButtonText, titleColor: .white)
            leftButton?.pulseColor = .white
            leftButton?.backgroundColor = Style.TextColor
            leftButton?.tg_width.equal(UIScreen.main.bounds.width/2 - 20)
            leftButton?.tg_centerX.equal(0)
            leftButton?.tg_height.equal(48)
            leftButton?.tg_top.equal(40)
            
            rightButton = RaisedButton(title: rightDialogButtonText, titleColor: .white)
            rightButton?.pulseColor = .white
            rightButton?.backgroundColor = Style.AccentColor
            rightButton?.tg_width.equal(UIScreen.main.bounds.width/2 - 20)
            rightButton?.tg_centerX.equal(0)
            rightButton?.tg_height.equal(48)
            rightButton?.tg_top.equal(40)
            
            let btnLayout = TGLinearLayout(.horz)
            btnLayout.tg_width.equal(UIScreen.main.bounds.width - 40)
            btnLayout.tg_height.equal(.wrap)
            btnLayout.addSubview(leftButton!)
            btnLayout.addSubview(rightButton!)
            
            
            layout.tg_left.equal(20)
            layout.tg_right.equal(20)
            layout.backgroundColor = .white
            layout.addSubview(titleLabel)
            layout.addSubview(messageLabel)
            layout.addSubview(btnLayout)
            
            
        }
        
        let relativeLayout = TGRelativeLayout()
        relativeLayout.tg_width.equal(self.view.frame.width)
        relativeLayout.tg_height.equal(self.view.frame.height)
        self.view = relativeLayout
        relativeLayout.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        relativeLayout.addSubview(layout)
        
    }
    
    
}


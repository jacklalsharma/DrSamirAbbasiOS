//
//  ImageViewerVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 17/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import UIKit
import TangramKit
import Material

class ImageViewerVC : BaseVC{
    
    var image : UIImage!

    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        let linear = TGLinearLayout(.vert)
        linear.tg_width.equal(UIScreen.main.bounds.width)
        linear.tg_height.equal(.wrap)
        linear.backgroundColor = Style.BackgroundColor
        linear.addSubview(getToolbar(title: "Gallery", isBackMenu: true, addSpinner : false))
        
        
        
        self.view.isOpaque = false
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        let layout = TGLinearLayout(.vert)
        layout.tg_width.equal(self.view.frame.width)
        layout.tg_height.equal(UIScreen.main.bounds.height)
        layout.tg_centerX.equal(0)
        layout.tg_centerY.equal(0)
        layout.tg_top.equal(200)
        
        layout.addSubview(getToolbar(title: "Gallery Image", isBackMenu: true, addSpinner : false))
        var image2 = UIImage(named: "strip.png")
        image2 = image2?.resize(toHeight: 3)
        image2 = image2?.resize(toWidth: UIScreen.main.bounds.width)
        
        let strip = UIImageView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 3))
        strip.image = image2
        strip.contentMode = UIViewContentMode.scaleAspectFill
        strip.tg_top.equal(8)
        layout.addSubview(strip)
        
        let imgView = UIImageView()
        imgView.tg_width.equal(UIScreen.main.bounds.width)
        imgView.tg_height.equal(200)
        imgView.contentMode = .scaleAspectFill
        imgView.image = image
        imgView.tg_centerX.equal(0)
        imgView.tg_centerY.equal(0)
        
        let relativeLayout = TGRelativeLayout()
        relativeLayout.tg_width.equal(self.view.frame.width)
        relativeLayout.tg_height.equal(self.view.frame.height)
        self.view = relativeLayout
        relativeLayout.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        relativeLayout.addSubview(imgView)
        relativeLayout.addSubview(layout)
        menuButton.addTarget(self, action: #selector(onBackPressed), for: .touchUpInside)
    }
    
    @objc
    func onBackPressed(){
        self.dismiss(animated: true, completion: nil)
    }
}

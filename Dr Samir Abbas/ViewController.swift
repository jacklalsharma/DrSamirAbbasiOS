//
//  ViewController.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 07/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import UIKit
import TangramKit
import Material

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "splash_background.png")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        
        
        let relativeLayout = TGRelativeLayout()
        relativeLayout.tg_width.equal(UIScreen.main.bounds.width)
        relativeLayout.tg_height.equal(UIScreen.main.bounds.height)
        relativeLayout.tg_backgroundImage = backgroundImage.image
        self.view = relativeLayout
        
        let linearLayout = TGLinearLayout(.horz)
        linearLayout.tg_width.equal(UIScreen.main.bounds.width)
        linearLayout.tg_height.equal(Style.Height48)
        linearLayout.addSubview(getRaisedButton(title: "ARABIC", isEnglish:  false))
        linearLayout.addSubview(getRaisedButton(title: "ENGLISH", isEnglish:  true))
        linearLayout.tg_centerX.equal(0)
        linearLayout.tg_centerY.equal(UIScreen.main.bounds.height/2 - Style.Height48)
        
        relativeLayout.addSubview(linearLayout)
        print(UIScreen.main.bounds.width)
        print(UIScreen.main.bounds.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Returns the raised button for bottom bar...
    func getRaisedButton(title : String, isEnglish : Bool) -> FlatButton{
        let btn = FlatButton(title : title,  titleColor : .white)
        
        btn.pulseColor = .white ;
        btn.tg_width.equal(UIScreen.main.bounds.width/2)
        btn.tg_centerX.equal(0)
        btn.tg_height.equal(Style.Height48)
        btn.titleLabel?.textAlignment = .left
        if(isEnglish == true){
            btn.addTarget(self, action: #selector(english), for: .touchUpInside)
        }else{
            btn.addTarget(self, action: #selector(arabic), for: .touchUpInside)
        }
        return btn ;
    }
    
    @objc
    func english(){
        Language.language = Language.english
        let nav = MasterVC()
        present(nav, animated: true, completion: nil)
    }
    
    @objc
    func arabic(){
        Language.language = Language.arabic
        let nav = MasterVC()
        present(nav, animated: true, completion: nil)
    }
}


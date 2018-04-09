//
//  MasterVC.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 09/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import UIKit
import KYDrawerController

class MasterVC : UIViewController {
    var window: UIWindow?

    override
    func viewDidLoad() {
        super.viewDidLoad()
        
        let mainController = NavigationVC()
        let slideMenuController = SlideMenuController(mainViewController: mainController, leftMenuViewController: LeftSlideMenuVC())
        mainController.slideMenu = slideMenuController
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = slideMenuController
        window?.makeKeyAndVisible()
    }
}

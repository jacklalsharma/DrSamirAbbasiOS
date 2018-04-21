//
//  Style.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 07/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation
import UIKit

class Style{
    static let BackgroundColor = UIColor(red : CGFloat(252 / 255.0), green : CGFloat(249 / 255.0), blue : CGFloat(249 / 255.0), alpha: 1)
    static let AccentColor = UIColor(red: CGFloat(61 / 255.0), green: CGFloat(122 / 255.0), blue: CGFloat(26 / 255.0), alpha: 1)
    static let TextColor = UIColor(red: CGFloat(139 / 255.0), green: CGFloat(153 / 255.0), blue: CGFloat(159 / 255.0), alpha: 1)
    static let ErrorColor = UIColor(red: CGFloat(213 / 255.0), green: CGFloat(0 / 255.0), blue: CGFloat(0 / 255.0), alpha: 1)
    static let SuccessColor = UIColor(red: CGFloat(56 / 255.0), green: CGFloat(142 / 255.0), blue: CGFloat(60 / 255.0), alpha: 1);
    static let InfoColor = UIColor(red: CGFloat(63 / 255.0), green: CGFloat(81 / 255.0), blue: CGFloat(181 / 255.0), alpha: 1);
    static let WarningColor = UIColor(red: CGFloat(255 / 255.0), green: CGFloat(169 / 255.0), blue: CGFloat(0 / 255.0), alpha: 1);
    static let Transparent = UIColor(red: CGFloat(255 / 255.0), green: CGFloat(169 / 255.0), blue: CGFloat(0 / 255.0), alpha: 0);
    
    static let ScreenWidth = UIScreen.main.bounds.width
    static let ScreenHeight = UIScreen.main.bounds.height
    
    static let Height60 = UIScreen.main.bounds.height / 12.26
    static let Width60 = UIScreen.main.bounds.width / 6.9
    
    static let Height50 = UIScreen.main.bounds.height / 14.76
    static let Width50 = UIScreen.main.bounds.width / 8.28
    
    static let Height65 = UIScreen.main.bounds.height / 11.32
    static let Width65 = UIScreen.main.bounds.width / 6.39
    
    static let Height48 = UIScreen.main.bounds.height / 15.33
    
    static let Height100 = UIScreen.main.bounds.height / 7.36
    static let Height90 = UIScreen.main.bounds.height / 8.17
    
    static let Height30 = UIScreen.main.bounds.height / 24.36
    static let Width30 = UIScreen.main.bounds.width / 13.8
    
    static let Width80 = UIScreen.main.bounds.width / 5.15
    static let Width90 = UIScreen.main.bounds.width / 4.6
    
    static let Height45 = UIScreen.main.bounds.height / 16.35
    static let Width45 = UIScreen.main.bounds.width / 9.2
    
    static let Height250 = UIScreen.main.bounds.height / 2.94
    
    static let Height20 = UIScreen.main.bounds.height / 36.8
    static let Width20 = UIScreen.main.bounds.width / 20.7
    static let Height25 = UIScreen.main.bounds.height / 29.44
    static let Width25 = UIScreen.main.bounds.width / 6.5
    
    static let Height120 = UIScreen.main.bounds.height / 6.13
    
    static let Height110  = UIScreen.main.bounds.height / 6.69
    
    static let Height80 = UIScreen.main.bounds.height / 9.2
    
    static let Height140 = UIScreen.main.bounds.height / 5.25
    
    
    static let TextSize18 = UIScreen.main.bounds.height / 46
    
    static let TextSize20 = UIScreen.main.bounds.height / 42
    
    static let TextSize16 = UIScreen.main.bounds.height / 52.57
    
    static let TextSize14 = UIScreen.main.bounds.height / 61.33

    
}

extension UIColor{
    func HexToColor(hexString: String, alpha:CGFloat? = 1.0) -> UIColor {
        // Convert hex string to an integer
        let hexint = Int(self.intFromHexString(hexStr: hexString))
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha = alpha!
        // Create color object, specifying alpha as well
        let color = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        return color
    }
    
    func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = NSCharacterSet(charactersIn: "#") as CharacterSet
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }
}

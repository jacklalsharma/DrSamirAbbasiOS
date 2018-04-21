//
//  SlotData.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 21/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation


class SlotData {
    
    var id : Int = 0
    
    var time : String = ""
    
    func getTime()->String{
        let fullNameArr = time.characters.split(separator: ":").map(String.init)
        var str = fullNameArr[0]
        str.append(":")
        str.append(fullNameArr[1])
        return str
    }
}

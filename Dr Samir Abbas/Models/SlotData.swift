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
    
    func getProperTime()->String{
        let fullNameArr = time.characters.split(separator: ":").map(String.init)
        var hr = Int(fullNameArr[0])
        var min = Int(fullNameArr[1])
        var str = ""

        if(hr! > 12){
            hr = hr! % 12
            str.append(String(hr!))
            str.append(":")
            str.append(fullNameArr[1])
            str.append(" PM")
        }else if(hr! < 12){
            str.append(String(hr!))
            str.append(":")
            str.append(fullNameArr[1])
            str.append(" AM")
        }else{
            str.append(String(hr!))
            str.append(":")
            str.append(fullNameArr[1])
            str.append(" PM")
        }
        return str
    }
}

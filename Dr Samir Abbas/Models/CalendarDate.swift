//
//  CalendarDate.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 09/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//

import Foundation

class CalendarDate {
    var day : String = "1"
    var month : String = "1"
    var year : String = "1"
    
    func getDate()->String{
        var date = year;
        date.append("-")
        date.append(month)
        date.append("-")
        date.append(day)
        
        return date;
    }
}

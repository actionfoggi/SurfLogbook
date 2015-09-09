//
//  EnumThickness.swift
//  SurfLogbook
//
//  Created by Sven Weiss on 02.09.15.
//  Copyright © 2015 W&K Druckluftanlagenbau GmbH. All rights reserved.
//

import Foundation

@objc
enum Thickness : Int32 {
    
    case mm_3_2 = 0, mm_4_3 = 1, mm_5_4 = 2, mm_6_5 = 3
    
    func simpleDescription() -> String {
        switch self {
        case .mm_3_2:
            return "3/2 mm"
        case .mm_4_3:
            return "4/3 mm"
        case .mm_5_4:
            return "5/4 mm"
        case .mm_6_5:
            return "6/5 mm"
        }
    }
    
    static let allValues = [mm_3_2,mm_4_3,mm_5_4,mm_6_5]
    
    static func getValue(text: String) -> Int32{
        
        if text == "3/2 mm"{
            return 0
        } else if text == "4/3 mm"{
            return 1
        } else if text == "5/4 mm"{
            return 2
        } else if text == "6/5 mm"{
            return 3
        }
        
        //TODO
        return -1
        
    }
    
    static func getText(number: NSNumber) -> String{
        
        switch number{
        case 0:
            return "3/2 mm"
        case 1:
            return "4/3 mm"
        case 2:
            return "5/4 mm"
        case 3:
            return "6/5 mm"
        default:
            return "error"
        }
        
    }
}

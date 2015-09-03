//
//  EnumThickness.swift
//  SurfLogbook
//
//  Created by Sven Weiss on 02.09.15.
//  Copyright © 2015 W&K Druckluftanlagenbau GmbH. All rights reserved.
//

import Foundation

enum Thickness : String{
    
    case mm_3_2 = "3/2 mm", mm_4_3 = "4/3 mm", mm_5_4 = "5/4 mm", mm_6_5 = "6/5 mm"
    
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
}
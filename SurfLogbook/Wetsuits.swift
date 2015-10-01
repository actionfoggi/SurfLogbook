//
//  Wetsuits.swift
//  SurfLogbook
//
//  Created by Sven Weiss on 05.09.15.
//  Copyright © 2015 W&K Druckluftanlagenbau GmbH. All rights reserved.
//

import UIKit
import CoreData

public class Wetsuits: NSManagedObject {
    
    @NSManaged var name:String
    @NSManaged var manufacturer:String
    @NSManaged var wetsuitThickness:String
    
    
    func simpleDescription() -> String{

        return  "\(manufacturer), \(name), \(wetsuitThickness) "
    }
}



public enum WetsuitThickness : String {
    
    case mm_3_2 = "3/2 mm"
    case mm_4_3 = "4/3 mm"
    case mm_5_4 = "5/4 mm"
    case mm_6_5 = "6/5 mm"
    
    static let allValues = [mm_3_2,mm_4_3,mm_5_4,mm_6_5]
    
    func simpleDescription() -> String {
        switch self {
        case .mm_3_2:
            return self.rawValue
        case .mm_4_3:
            return self.rawValue
        case .mm_5_4:
            return self.rawValue
        case .mm_6_5:
            return self.rawValue
        }
    }
}

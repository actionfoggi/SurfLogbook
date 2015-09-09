//
//  Wetsuits.swift
//  SurfLogbook
//
//  Created by Sven Weiss on 05.09.15.
//  Copyright © 2015 W&K Druckluftanlagenbau GmbH. All rights reserved.
//

import UIKit
import CoreData

class Wetsuits: NSManagedObject {
    
    @NSManaged var name:String
    @NSManaged var manufacturer:String
    @NSManaged var thickness:NSNumber
    
    func simpleDescription() -> String{

        return  "\(manufacturer), \(name), \(Thickness.getText(thickness))"
    }


}

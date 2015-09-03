//
//  EnumSkyConditions.swift
//  SurfLogbook
//
//  Created by Sven Weiss on 25.08.15.
//  Copyright (c) 2015 W&K Druckluftanlagenbau GmbH. All rights reserved.
//

import Foundation

enum SkyConditions : String{
    
    case Sunny = "sunny", Partly_cloudy="partly cloudy", Cloudy="cloudy", Rain="rain", Heavy_rain="heavy rain", Snow="snow", Heavy_snow="heavy snow"
    
    func simpleDescription() -> String {
        switch self {
        case .Sunny:
            return "sunny"
        case .Partly_cloudy:
            return "partly cloudy"
        case .Cloudy:
            return "cloudy"
        case .Rain:
            return "rain"
        case .Heavy_rain:
            return "heavy rain"
        case .Snow:
            return "snow"
        case .Heavy_snow:
            return "heavy snow"
        }
    }
    
    static let allValues = [Sunny, Partly_cloudy, Cloudy, Rain, Heavy_rain, Snow, Heavy_snow]
}
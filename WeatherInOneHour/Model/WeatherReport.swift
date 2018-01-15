//
//  WeatherReport.swift
//  WeatherInOneHour
//
//  Created by Iain Coleman on 14/01/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import Foundation

struct WeatherReport {
    
    public private(set) var main: String
    public private(set) var description: String
    public private(set) var icon: String
    public private(set) var temp: Double
    public private(set) var temp_min: Double
    public private(set) var temp_max: Double

    
    init(main: String, description: String, icon: String, temp: Double, temp_min: Double, temp_max: Double) {
        self.main = main
        self.description = description
        self.icon = icon
        self.temp = temp
        self.temp_min = temp_min
        self.temp_max = temp_max
    }
    
    
    
}

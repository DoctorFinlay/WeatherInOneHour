//
//  APIService.swift
//  WeatherInOneHour
//
//  Created by Iain Coleman on 14/01/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIService {
    
    static let instance = APIService()
    
    public private(set) var currentWeather = WeatherReport(main: "", description: "", icon: "", temp: 0.0, temp_min: 0.0, temp_max: 0.0)
    
    
    enum jsonKeys: String {
        
        case weather
        case main
        case description
        case icon
        case temp
        case temp_min
        case temp_max
        
    }
    
    
    func getWeatherReport(cityName: String, completion: @escaping CompletionHandler) {
        
        let fullURL = "\(BASE_URL)?APPID=\(API_KEY)&q=\(cityName)"
        print(fullURL)
        Alamofire.request(fullURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else {return}
                print(data)
                self.parseWeatherReport(data: data)
                print("Weather is \(self.currentWeather.description)")
                completion(true)
            } else {
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
    }
    
    func parseWeatherReport(data: Data)  {
        
        do {
            let json = try JSON(data: data)
            let mainArray = json[jsonKeys.weather.rawValue].arrayValue.map{$0[jsonKeys.main.rawValue].stringValue}
            var main = mainArray[0]
            if mainArray.count > 1 {
                for i in 1...mainArray.count-1 {
                    main = "\(main), \(mainArray[i])"
                }
            }
            print(main)

            let descriptionArray = json[jsonKeys.weather.rawValue].arrayValue.map{$0[jsonKeys.description.rawValue].stringValue}
            var description = descriptionArray[0]
            if descriptionArray.count > 1 {
                for i in 1...descriptionArray.count-1 {
                    description = "\(description), \(descriptionArray[i])"
                }
            }
          
            let iconArray = json[jsonKeys.weather.rawValue].arrayValue.map{$0[jsonKeys.icon.rawValue].stringValue}
            let icon = iconArray[0]
            
            let temp = json[jsonKeys.main.rawValue][jsonKeys.temp.rawValue].doubleValue
            
            let temp_min = json[jsonKeys.main.rawValue][jsonKeys.temp_min.rawValue].doubleValue
            
            let temp_max = json[jsonKeys.main.rawValue][jsonKeys.temp_max.rawValue].doubleValue
            
            currentWeather = WeatherReport(main: main, description: description, icon: icon, temp: temp, temp_min: temp_min, temp_max: temp_max)
            
            
            
        } catch {
            print(error)
        }
        
    }
    
    
    
    
}

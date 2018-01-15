//
//  WeatherReportVC.swift
//  WeatherInOneHour
//
//  Created by Iain Coleman on 15/01/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import UIKit

class WeatherReportVC: UIViewController {

    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    var toPass = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        spinner.isHidden = false
        spinner.startAnimating()
        
        APIService.instance.getWeatherReport(cityName: toPass) { (success) in
            
            if success {
                self.descriptionLbl.text = APIService.instance.currentWeather.main
                let weatherInCelsius = APIService.instance.currentWeather.temp - 273.15
                self.currentTempLbl.text = "Temperature: \(weatherInCelsius) C"
                
                self.spinner.stopAnimating()
                self.spinner.isHidden = true
            } else {
                self.cityNameLbl.text = "Not found..."
            }
        }

        cityNameLbl.text = toPass
        
        
        
    }

    

}

//
//  ViewController.swift
//  WeatherInOneHour
//
//  Created by Iain Coleman on 14/01/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == TO_WEATHER_REPORT {
            let DestViewController : WeatherReportVC = segue.destination as! WeatherReportVC
            DestViewController.toPass = textField.text!
        }
        
    }
    
    @IBAction func btnPressed(_ sender: Any) {
        
        if textField.text != "" {
                        
            performSegue(withIdentifier: TO_WEATHER_REPORT, sender: nil)
            
        }
        
    }
    
    
    
}


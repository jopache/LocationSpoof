//
//  ViewController.swift
//  Location Spoof 2
//
//  Created by Ben Orser on 10/2/19.
//  Copyright © 2019 Ben Orser. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    
    @IBOutlet weak var askForLocationButton: UIButton!
    @IBAction func AskForLocation(_ sender: Any) {
        prompt()
    }
    
    func prompt() {
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined,
            .denied,
            .restricted:
                locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways,
             .authorizedWhenInUse:
            askForLocationButton.isHidden = true
        default: ()
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        prompt()
        super.viewDidAppear(animated)
    }
    
    
}


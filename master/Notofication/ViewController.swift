//
//  ViewController.swift
//  Notofication
//
//  Created by subramanyam on 02/11/18.
//  Copyright © 2018 mahiti. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    var locManager = CLLocationManager()
    var location: CLLocation?
    override func viewDidLoad() {
        super.viewDidLoad()
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestWhenInUseAuthorization()
        locManager.startUpdatingLocation()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
     
        //print(locations.last?.coordinate.latitude)
        //print(locations.last?.coordinate.longitude)
        
        let gLoc = CLGeocoder()
        var place: CLPlacemark?
//        gLoc.reverseGeocodeLocation(locations.last!) { (placemark, error) in
//            let pm = placemark
//            if (pm != nil){
//                place = CLPlacemark(placemark: pm![0])
//                print(place?.addressDictionary!)
//            }
//        }
        
        gLoc.geocodeAddressString("724 2nd B Main Road,Banaswadi,Bengaluru,Karnataka 560043,India") { (placemark, error) in
            
            let pm = placemark![0]
            let loc:CLLocationCoordinate2D = (pm.location?.coordinate)!
            print(loc.latitude,loc.longitude)
        }
    }

}


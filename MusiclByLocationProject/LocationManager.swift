//
//  LocationManager.swift
//  MusiclByLocationProject
//
//  Created by Shanahan, Krystian (JD) on 02/03/2022.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate{
    let manager = CLLocationManager()
    
    
    weak var stateController : stateController?
    
    let geoCoder = CLGeocoder()
    
    
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestAuth() {
        manager.requestWhenInUseAuthorization()
    }
    
    func requestLocation() {
        manager.requestLocation()
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let firstLocation = locations.first {
            geoCoder.reverseGeocodeLocation(firstLocation, completionHandler: {(placemarks,error) in
                if error != nil {
                    self.stateController?.lastKnowLocation = "Couldnt perform lookup of location from coordinate infromation"
                } else {
                    if let firstPlacemark = placemarks?[0] {
                        self.stateController?.lastKnownLocality = firstPlacemark.locality ?? "Couldn't find locality"
                        self.stateController?.lastKnownCountry = firstPlacemark.country ?? "Coudn't find country"
                        self.stateController?.lastKnownsubLocality = firstPlacemark.subLocality ?? "couldnt find subLocality"
                    }
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.stateController?.lastKnowLocation = "error finding location"
    }
            
    
}

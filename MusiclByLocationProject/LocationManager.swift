//
//  LocationManager.swift
//  MusiclByLocationProject
//
//  Created by Shanahan, Krystian (JD) on 02/03/2022.
//

import Foundation
import CoreLocation

class LocationHandler: NSObject, CLLocationManagerDelegate,ObservableObject {
    let manager = CLLocationManager()
    @Published var lastKnownLocality : String = ""
    @Published var lastKnownCountry : String  = ""
    @Published var lastKnownsubLocality : String = ""
    @Published var lastKnowLocation : String =  ""
    
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
                    self.lastKnowLocation = "Couldnt perform lookup of location from coordinate infromation"
                } else {
                    if let firstPlacemark = placemarks?[0] {
                        self.lastKnownLocality = firstPlacemark.locality ?? "Couldn't find locality"
                        self.lastKnownCountry = firstPlacemark.country ?? "Coudn't find country"
                        self.lastKnownsubLocality = firstPlacemark.subLocality ?? "couldnt find subLocality"
                    }
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        lastKnowLocation = "error finding location"
    }
            
    
}

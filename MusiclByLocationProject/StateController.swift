//
//  StateController.swift
//  MusiclByLocationProject
//
//  Created by Shanahan, Krystian (JD) on 02/03/2022.
//

import Foundation

class stateController: ObservableObject {
    @Published var lastKnowLocation : String = ""
    @Published var lastKnownLocality : String = ""
    @Published var lastKnownCountry : String = ""
    @Published var lastKnownsubLocality: String = ""
    let locationHandler = LocationHandler()
    
    func findMusic() {
        locationHandler.requestLocation()
    }
    func requestAccesstoLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuth()
    }
    
    func getArtists() {
       guard let url = URL(string: "https://itunes.apple.com/search?term=Lionel%20Richie&entity=musicArtist")
        else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {(data,response,error) in
            if let data = data {
                print(String(decoding : data, as: UTF8.self))
            }
        }.resume()
    }
    
}

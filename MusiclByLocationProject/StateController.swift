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
    @Published var artistNames : String = ""
    
    let locationHandler = LocationHandler()
    
    func findMusic() {
        locationHandler.requestLocation()
    }
    func requestAccesstoLocationData() {
        locationHandler.stateController = self
        locationHandler.requestAuth()
    }
    
    func getArtists() {
       guard let url = URL(string: "https://itunes.apple.com/search?term=\(lastKnownCountry)&entity=musicArtist")
        else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {(data,response,error) in
            if let data = data {
                if let response = self.parseJSON(json: data) {
                    let names = response.results.map {
                        return $0.name
                    }
                    
                    DispatchQueue.main.async {
                        self.artistNames = names.joined(separator: ", ")
                    }
                }
            }
        }.resume()
    }
    
    func parseJSON(json:Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("ERROR DECODING JSON")
            return nil
        }
        
        
        
        
        
        
    }
    
}

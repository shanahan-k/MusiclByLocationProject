//
//  ArtistResponse.swift
//  MusiclByLocationProject
//
//  Created by Shanahan, Krystian (JD) on 03/03/2022.
//

import Foundation


struct ArtistResponse: Codable {
    var count : Int
    var results : [Artist]
    
    private enum CodingKeys: String,CodingKey {
        case count = "count"
        case results = "results"
    }
    
}

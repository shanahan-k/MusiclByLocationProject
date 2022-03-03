//
//  Artist.swift
//  MusiclByLocationProject
//
//  Created by Shanahan, Krystian (JD) on 03/03/2022.
//

import Foundation


struct Artist : Codable {
    var name : String
    
    
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
    }
    
}





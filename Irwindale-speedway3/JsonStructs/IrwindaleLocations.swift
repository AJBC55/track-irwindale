//
//  IrwindaleLocations.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 1/30/24.
//

import Foundation

// this is fine
struct IrwindaleLocation: Identifiable, Decodable{
    let id: UUID = UUID()
    var name: String
    var lat: Double
    var lon: Double
    var imageName: String
    var description: String
    
}

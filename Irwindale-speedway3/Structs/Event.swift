//
//  Event.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 1/31/24.
//

import Foundation



struct Event: Identifiable, Decodable{
    let id: UUID = UUID()
    var eventName : String?
    var eventDate : String?
    var eventTime : [String]?
    var eventImg : String?
    var eventDescription : String?
    var eventticketLink : String?
}

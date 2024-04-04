//
//  Event.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 1/31/24.
//

import Foundation

    // this needs to be modified to work with the api

struct Event: Identifiable, Decodable{
    var id: Int
    var name: String?
    var description: String?
    var event_start: String?
    var ticket_link: String?
    var img_link: String?
    var is_saved: Bool?
}

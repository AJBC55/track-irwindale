//
//  userCreate.swift
//  Irwindale-speedway3
//
//  Created by Siddhu Sarvepally on 4/1/24.
//

import Foundation

struct userCreate: Encodable {
    var email: String
    var username: String
    var phone_number: String?
    var password: String
    var name_first: String
    var name_last: String
}
struct user: Decodable, Identifiable{
    var id: Int?
    var email: String?
    var username: String?
    var phone_number: String?
    var password: String?
    var name_first: String?
    var name_last: String?
}

//
//  userAPI.swift
//  Irwindale-speedway3
//
//  Created by Siddhu Sarvepally on 4/1/24.
//

import UIKit

let url = URL(string: "https://track-andrew-b967c8424989.herokuapp.com/docs#/")!
var request = URLRequest(url: url)

struct userAPI: Codable {
    func createUser() {
        // send a post request to the API to create a user
        
        request.httpMethod = "POST"
        let user = userCreate(
            email: "user@example.com",
            password: "myPassword",
            name_first: "Sidd",
            name_last: "Sarvepally"
        )
        
        let data = try! JSONEncoder().encode(user)
        
        

    }
}

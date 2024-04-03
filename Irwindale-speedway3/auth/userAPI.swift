//
//  userAPI.swift
//  Irwindale-speedway3
//
//  Created by Siddhu Sarvepally on 4/1/24.
//

import UIKit

let urlUser = URL(string: "https://track-andrew-b967c8424989.herokuapp.com/user")!
var requestcreateUser = URLRequest(url: urlUser)

struct userAPI: Codable {
    
    func createUser() {
        let coder = JSONEncoder()
        // send a post request to the API to create a user
        
        requestcreateUser.httpMethod = "POST"
        let user = userCreate(
            email: "user@example.com",
            username: "siddu",
            password: "myPassword",
            name_first: "Sidd",
            name_last: "Sarvepally"
        )
        do{
            let data = try coder.encode(user)
            requestcreateUser.httpBody = data
        }
        catch{
            print(error)
        }
        let task =  URLSession.shared.dataTask(with: requestcreateUser){data, responce, error in
            if let error = error {
                print("Error with fetching user: \(error)")
                return
            }
            
        }
    }
}

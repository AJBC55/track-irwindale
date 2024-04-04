//
//  userAPI.swift
//  Irwindale-speedway3
//
//  Created by Siddhu Sarvepally on 4/1/24.
//

import UIKit



struct apiFunctions {
    // Function to create a user
    func createUser(userData: userCreate) async {
        guard let urlUser = URL(string: "http://127.0.0.1:8000/user") else { return }
        var requestcreateUser = URLRequest(url: urlUser)
        let coder = JSONEncoder()
        
        requestcreateUser.httpMethod = "POST"
        requestcreateUser.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let data = try coder.encode(userData)
            requestcreateUser.httpBody = data
            
            let (datarecived, response) = try await URLSession.shared.data(for: requestcreateUser)
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            
            // Here, you can handle the data returned from the server if needed
            // For example, decoding JSON into a Swift struct
            
        } catch {
            print("Error: \(error)")
        }
       
    }
}


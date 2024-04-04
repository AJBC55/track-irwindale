//
//  userAPI.swift
//  Irwindale-speedway3
//
//  Created by Siddhu Sarvepally on 4/1/24.
//

import UIKit



struct apiFunctions {
    // Function to create a user
    /// Description
    /// - Parameter userData: userData description
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
    
    
    
    
    func saveEvent(id: Int) async{
        let token = Global.token // this gets the global token
        
        guard let urlSave = URL(string: "http://127.0.0.1:8000/events/save/\(id)") else { return }
        var save = URLRequest(url: urlSave)
        let decoder = JSONDecoder()
        print(token)
        save.httpMethod = "POST"
        save.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        do{
            let (data, response) = try await URLSession.shared.data(for: save)
            print(data)
            print("connected")
            
            guard let httpResponse = response as? HTTPURLResponse
            else{
                print("Error with the response, unexpected status code: \(String(describing: response))")
                return
            }
            print(httpResponse.statusCode)
            if httpResponse.statusCode == 401{
                print("Please login")
                Global.token = ""
                Global.isAuthenticated = false
            }
           return
        }catch{
            print("api error")
        }
        
        
        
        
        
        
        
        
        
    }
}


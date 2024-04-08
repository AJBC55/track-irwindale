//
//  auth.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 4/3/24.
//

import Foundation

// this file handes authenticantion requests

struct Token: Decodable {
    var access_token: String
    var  token_type: String
}
struct Auth{
    // this is a funcion to login a user
    // the it takese two peramiters user name and password
    // it will throw an error if it did not sucseed
    
    
    func login(username: String, password: String) async throws {
        guard let url = URL(string: "https://track-andrew-b967c8424989.herokuapp.com/login") else {
            throw ServerError.urlCreationError
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        let parameters = "username=\(username)&password=\(password)"
        request.httpBody = parameters.data(using: .utf8)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw ServerError.unexpectedStatusCode(-1) // Use when response is not HTTPURLResponse
            }
            
            if httpResponse.statusCode == 401 {
                throw ServerError.invalidCredentials
            } else if !(200...299).contains(httpResponse.statusCode) {
                throw ServerError.unexpectedStatusCode(httpResponse.statusCode)
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Token.self, from: data)
                // Assuming Global is a correctly implemented singleton
                Global.token = result.access_token
                Global.isAuthenticated = true
                
            } catch {
                throw JsonError.decodingError(error)
            }
        } catch {
            throw ServerError.networkError(error)
        }
    }
    

        
       
    
}


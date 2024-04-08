//
//  User.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 4/4/24.
//

import Foundation


struct User{
    
    
    
    // this funcion creates a user if it runs without errors the user is created
    func create(userData: userCreate) async throws{
        // if can create the url else throw error
        guard let url = URL(string: "https://track-andrew-b967c8424989.herokuapp.com/user") else{ throw ServerError.urlCreationError}
        var request = URLRequest(url: url)
        // specifing that the reqest is a post request
        request.httpMethod = "POST"
        // allowing for a json body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // coder is the json encoder
        let coder = JSONEncoder()
        // try to parse into json
        do{
            let json =  try coder.encode(userData)
            // add json body to request
            request.httpBody = json
            // try to make the url reqest
            do{
                let (data, response) = try await URLSession.shared.data(for: request)
                // turn the response into a httpresponse
                guard let httpResponse = response as? HTTPURLResponse else{ throw ServerError.unexpectedStatusCode(-1)}
                // check if unique constaint is found
                if httpResponse.statusCode == 409{
                    throw ServerError.dataConfict
                } else if !(200...299).contains(httpResponse.statusCode) {
                    // if the response is not acceptable
                    throw ServerError.unexpectedStatusCode(httpResponse.statusCode)
                }
            } catch{
                throw ServerError.networkError(error)
            }
        } catch {
            throw JsonError.encodingError(error)
        }
    }
    
           
           
       
    }


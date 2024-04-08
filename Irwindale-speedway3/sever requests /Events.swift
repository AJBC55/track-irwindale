//
//  Events.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 4/4/24.
//

import Foundation


struct Events{
    // this function gets evenets from the api it will throw an error if it cannot get events
    func getevetnData() async throws -> [Event]{
        // get the jwt token if the user is logged in
        let token = Global.token
        // creates a url thows if it cannot
        guard let url = URL(string: "https://track-andrew-b967c8424989.herokuapp.com/events") else{ throw ServerError.urlCreationError}
        // create url request
        var request = URLRequest(url: url)
        // add bearer token headers
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        // atempt to make a url session
        do{
            let (data, response) = try await URLSession.shared.data(for: request)
            // check the response
            guard let httpResponse = response as? HTTPURLResponse else{ throw ServerError.unexpectedStatusCode(-1)}
            // check the http response
            if !(200...299).contains(httpResponse.statusCode){
                throw ServerError.unexpectedStatusCode(httpResponse.statusCode)
            }
            do{
                // try to decode data
                let decoder = JSONDecoder()
                let result =  try decoder.decode([Event].self, from: data)
                // return result
                return result
            }catch{
                throw JsonError.decodingError(error)
            }
        } catch{
           throw ServerError.networkError(error)
        }
    }
    
    
    
    // this funcion will save an event if no errors the request sucseeded
    func eventSave(id: Int) async throws{
        // get jwt token
        let token = Global.token
        // create the url
        guard let url = URL(string: "https://track-andrew-b967c8424989.herokuapp.com/events/save/\(id)") else{ throw ServerError.urlCreationError}
        // create request
        var request = URLRequest(url: url)
        // set token header
        request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        request.httpMethod = "POST"
        // make a url session
        do{
            let(data, response) = try await URLSession.shared.data(for: request)
            // turn the response into a http resposnse
            guard let httpResponse = response as? HTTPURLResponse else{ throw ServerError.unexpectedStatusCode(-1)}
            // check for 404 response
            if httpResponse.statusCode == 401{
                // check if 401
                Global.isAuthenticated = false
                Global.token = ""
                throw ServerError.invalidCredentials
                
            }else if httpResponse.statusCode == 404{
                // check if 404
                throw ServerError.notFound
            }else if !(200...299).contains(httpResponse.statusCode){
                // check if any other back status code
                throw ServerError.unexpectedStatusCode(httpResponse.statusCode)
            }
        }
        }
    
    
    
    func getSavedEvents() async throws -> [Event] {
        // Get JWT token
        let token = Global.token
        
        // Create the URL
        guard let url = URL(string: "https://track-andrew-b967c8424989.herokuapp.com/events/save") else {
            throw ServerError.urlCreationError
        }
        
        // Create request
        var request = URLRequest(url: url)
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Make a URL session
        let (data, response) = try await URLSession.shared.data(for: request)
        print(response)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ServerError.unexpectedStatusCode(-1)
        }
        
        // Check the status code
        if httpResponse.statusCode == 401 {
            Global.isAuthenticated = false
            Global.token = ""
            throw ServerError.invalidCredentials
        } else if httpResponse.statusCode == 404 {
            throw ServerError.notFound
        } else if !(200...299).contains(httpResponse.statusCode) {
            throw ServerError.unexpectedStatusCode(httpResponse.statusCode)
        }
        
        // Try to decode JSON
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode([Event].self, from: data)
            return result
        } catch {
            throw JsonError.decodingError(error)
        }
    }

    }


//
//  auth.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 4/3/24.
//

import Foundation

struct Token: Decodable {
    var access_token: String
    var  token_type: String
}
struct Auth{
    
    func login(username: String, password: String) async -> Token{
        guard let url = URL(string: "http://127.0.0.1:8000/login") else { return Token(access_token: "", token_type: "")}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

            let parameters = "username=\(username)&password=\(password)"
            request.httpBody = parameters.data(using: .utf8)
        do{
            let(data, response) = try await URLSession.shared.data(for: request)
            print(response)
            print(data)
            
            do{
                let decoder = JSONDecoder()
                let result =  try decoder.decode(Token.self, from: data)
                Global.token = result.access_token
                Global.isAuthenticated = true
                print(Global.token)
                
                return result
                
            } catch{
                print("json decoding error")
            }
            
            
        } catch{
            print("http error")
        }
        
       
        
        return Token(access_token: "", token_type: "")
    }
    
}


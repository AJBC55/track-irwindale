//
//  DataService.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 1/30/24.
//

import Foundation

// update the data servie for the new api
// this page is for date retrival only and saving events, auth will be handaled in another file. 
struct DataService{
    
    func getLocationData() -> [IrwindaleLocation]{
        if let locationUrl = Bundle.main.url(forResource: "irwindalelocations", withExtension: ".json"){
            
            do{
                let decoder = JSONDecoder()
                let data = try Data(contentsOf: locationUrl)
                do{
                    let result = try decoder.decode([IrwindaleLocation].self, from: data)
                    return result
                }
                catch{
                    print(error)
                }
            }
            catch{
                print(error)
            }
        }
        
        
        return [IrwindaleLocation]()
        
        
    }
    func geteventapiData() async -> [Event]{
        let token = Global.token
        if let url = URL(string: "http://127.0.0.1:8000/events"){
            var request = URLRequest(url: url)
            request.setValue( "Bearer \(token)", forHTTPHeaderField: "Authorization")
            do{
                let (data, _) = try await URLSession.shared.data(for: request)
                let decoder  = JSONDecoder()
                
                let result = try decoder.decode( [Event].self, from: data )
               
                return result
                
            }
            catch{
                print(error)
            }
        }
        return [Event]()
    }
    
    func getnewsData() async -> [News]{
        if let url = URL(string: "http://127.0.0.1:8000/news"){
            let request = URLRequest(url: url)
            
            do{
                let (data , response) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                
                let result = try decoder.decode( [News].self , from: data)
                return result
            }
            catch{
                print(error)
            }
        }
        return [News]()
    }
    
    func getlocapiData() async -> [IrwindaleLocation]{
        if let url = URL(string: "http://127.0.0.1:8000/locations"){
            let request = URLRequest(url: url)
            do{
                let (data, response) = try await URLSession.shared.data(for: request)
                let decoder = JSONDecoder()
                
                let result = try decoder.decode([IrwindaleLocation].self, from: data)
                return result
            }
            catch{
                print(error)
                
            }
        }
        return [IrwindaleLocation]()
    }
    func geteventData() -> [Event]{
        if let locationUrl = Bundle.main.url(forResource: "events", withExtension: ".json"){
            
            do{
                let decoder = JSONDecoder()
                let data = try Data(contentsOf: locationUrl)
                do{
                    let result = try decoder.decode([Event].self, from: data)
                    return result
                }
                catch{
                    print(error)
                }
            }
            catch{
                print(error)
            }
        }
        
        
        return [Event]()
        
        
    }
    
}

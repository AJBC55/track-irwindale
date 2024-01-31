//
//  DataService.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 1/30/24.
//

import Foundation


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
}

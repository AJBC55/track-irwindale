//
//  Helper.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 2/7/24.
//

import Foundation



struct Helper{
    static func eventnameformat(eventName : String) -> String{
        let lls = eventName.split(separator: ":")
        if lls.count >= 2{
            
            return String(lls[1]).trimmingCharacters(in: .whitespaces)
        }
        else{
            return String(lls[0])
        }
    }
}

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
        else {
            return String(lls[0])
        }
    }
}

func isInputValid(email: String, username: String, password: String, confirmPassword: String, name_first: String, name_last: String) -> Bool {
    if password != confirmPassword {
        errorMessage = "Password do not match."
        return false
    }
    
    if email == "" || username == "" || password == "" || confirmPassword == "" || name_first == "" || name_last == "" {
        errorMessage = "Please fill in all the fields."
        return false
    }
    
    return true
}

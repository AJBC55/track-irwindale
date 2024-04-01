//
//  createAcount.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 4/1/24.
//

import SwiftUI

// This is a view to create an acounnt 

struct createAcount: View {
    @State var username: String = ""
    @State var email: String = ""
    @State  var firstName: String = ""
    @State var lastName: String = ""
    @State var phoneNumber: String = ""
    @State var password: String = ""
    @State var confirmPassowrd:  String = ""
    
    var body: some View {
        Text("Create Acount")
            .font(.title)
            .bold()
        TextField("First Name", text: $firstName )
            .textFieldStyle(.roundedBorder)
            .padding()
        TextField("Last Name", text: $lastName)
            .textFieldStyle(.roundedBorder)
            .padding()
        TextField("Username ", text: $username)
            .textFieldStyle(.roundedBorder)
            .padding()
        TextField("Email", text: $lastName)
            .textFieldStyle(.roundedBorder)
            .padding()
        
        
        
        
    }
}

#Preview {
    createAcount()
}

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
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var password: String = ""
    @State var confirmPassowrd:  String = ""
    
    var body: some View {
        //Text("Create Acount")
            //.font(.title)
            //.bold()
        TextField("First Name", text: $firstName)
            .padding()
            .frame(width: 300, height:50)
            .background(Color.black.opacity(0.05))
            .cornerRadius(5)
        
        TextField("Last Name", text: $lastName)
            .padding()
            .frame(width: 300, height:50)
            .background(Color.black.opacity(0.05))
            .cornerRadius(5)
        
        TextField("Username", text: $username)
            .padding()
            .frame(width: 300, height:50)
            .background(Color.black.opacity(0.05))
            .cornerRadius(5)

        TextField("Email", text: $email)
            .padding()
            .frame(width: 300, height:50)
            .background(Color.black.opacity(0.05))
            .cornerRadius(5)
        
        SecureField("Password", text: $password)
            .padding()
            .frame(width: 300, height:50)
            .background(Color.black.opacity(0.05))
            .cornerRadius(5)
        
        SecureField("Confirm Password", text: $confirmPassowrd)
            .padding()
            .frame(width: 300, height:50)
            .background(Color.black.opacity(0.05))
            .cornerRadius(5)
        
        Button("Login") {}
        .foregroundColor(.white)
        .bold()
        .frame(width: 300, height: 45)
        .background(Color.blue)
        .cornerRadius(10)
        
        
        
        
        
    }
}

#Preview {
    createAcount()
}

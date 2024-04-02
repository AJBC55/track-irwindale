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
        //Text("Create Acount")
            //.font(.title)
            //.bold()
        TextField("First Name", text: $firstName )
            .textFieldStyle(.roundedBorder)
            .padding()
        TextField("Last Name", text: $lastName)
            .textFieldStyle(.roundedBorder)
            .padding()
        TextField("Username", text: $username)
            .textFieldStyle(.roundedBorder)
            .padding()
        TextField("Phone Number", text: $phoneNumber)
            .textFieldStyle(.roundedBorder)
            .padding()
        TextField("Email", text: $email)
            .textFieldStyle(.roundedBorder)
            .padding()
        TextField("Password", text: $password)
            .textFieldStyle(.roundedBorder)
            .padding()
        TextField("Confirm Password", text: $confirmPassowrd)
            .textFieldStyle(.roundedBorder)
            .padding()
        Button{
            // logic to create an acount
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 40)
                    .padding()
                Text("Create Acount")
                    .foregroundStyle(.white)
                    .bold()
            }
        }
        
        
        
        
        
    }
}

#Preview {
    createAcount()
}

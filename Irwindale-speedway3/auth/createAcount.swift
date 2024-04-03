//
//  createAcount.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 4/1/24.
//

import SwiftUI

// This is a view to create an acounnt 

struct createAcount: View {
    let apiFuncs = apiFunctions()
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
        
        Button{
            // logic for creating a user
            Task{
                await apiFuncs.createUser(userData: userCreate(email: email, username: username, password: password, name_first: firstName, name_last: lastName))
            }
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .frame(height: 50)
                Text("Create Acount")
                    .foregroundStyle(.white)
                    .bold()
            }
            
            
        }
        .padding(20)
        .padding(.horizontal, 22)
        
        
        
        
        
        
    }
}

#Preview {
    createAcount()
}

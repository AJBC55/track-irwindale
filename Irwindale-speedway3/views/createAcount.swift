//
//  createAcount.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 4/1/24.
//

import SwiftUI

// This is a view to create an acounnt 
var errorMessage: String = ""

struct createAcount: View {
    let userRequests = User()
    @State var username: String = ""
    @State var email: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    var passwordsMatch: Bool {
            password == confirmPassword
        }
    
    var body: some View {
            TextField("First Name", text: $firstName)
                .padding()
                .frame(width: 300, height:50)
                .background(Color.black.opacity(0.08))
                .cornerRadius(5)
            
            TextField("Last Name", text: $lastName)
                .padding()
                .frame(width: 300, height:50)
                .background(Color.black.opacity(0.08))
                .cornerRadius(5)

            TextField("Username", text: $username)
                .padding()
                .frame(width: 300, height:50)
                .background(Color.black.opacity(0.08))
                .cornerRadius(5)
                .textInputAutocapitalization(.never)

            TextField("Email", text: $email)
                .padding()
                .frame(width: 300, height:50)
                .background(Color.black.opacity(0.08))
                .cornerRadius(5)
                .textInputAutocapitalization(.never)
                .textContentType(.emailAddress)
            
            SecureField("Password", text: $password)
                .padding()
                .frame(width: 300, height:50)
                .background(Color.black.opacity(0.08))
                .cornerRadius(5)
                .textInputAutocapitalization(.never)
        
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .frame(width: 300, height:50)
                .background(Color.black.opacity(0.08))
                .cornerRadius(5)
                .textInputAutocapitalization(.never)
                .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(passwordsMatch ? Color.clear : Color.red, lineWidth: 2))
            
        
            Button(action: {
                            Task {
                                    do {
                                        try await userRequests.create(userData: userCreate(email: email, username: username, password: password, name_first: firstName, name_last: lastName))
                                    } catch {
                                        errorMessage = error.localizedDescription
                                    }
                                
                            }
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: 300, height: 50)
                                Text("Create Account")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }
                        .padding(10)

                        
                        if !errorMessage.isEmpty {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .padding()
                        }
            
        
    }
}
    
#Preview {
    createAcount()
}



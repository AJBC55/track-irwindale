//
//  login.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 3/31/24.
//
import SwiftUI

struct login: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var validLogin = false
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height:50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(5)
                    
                    SecureField("Password", text: $password)
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
                    
                    Button{}
                    label: {
                        Text("Create Account")
                            .underline()
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    login()
}

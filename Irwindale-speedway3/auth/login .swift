//
//  login .swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 3/31/24.
//

import SwiftUI
// This is a logtin ui there will be a button to create a acount and two text fields for username and passowrd
struct login_: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
        VStack{
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
                .padding()
            TextField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button{
                // login button loging goes here
            }label: {
                ZStack{
                   
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 40)
                    Text("Login")
                        .foregroundStyle(.white)
                        .bold()
                    
                        
                
                }
                .padding()
                
                    
            }
            Button{
                // this button will take you to a new page to create a acout
            }label: {
                Text("Create Acount")
                    .underline()
            }
            
        }
    }
}
#Preview {
    login_()
}

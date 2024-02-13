//
//  ContentView.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 1/30/24.
//

import SwiftUI

struct Main_View: View {
    var body: some View {
        TabView{
            EventsView().tabItem {
                VStack{
                    Image(systemName: "list.bullet")
                    Text("Events")
                }
            }
                HomeView().tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("Home")
                    }
                        
                    }
                
            }
        
        .tabViewStyle(DefaultTabViewStyle())
    }
}

#Preview {
    Main_View()
}
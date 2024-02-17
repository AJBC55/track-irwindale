//
//  HomeView.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 1/30/24.
//

import SwiftUI

struct HomeView: View {
   
    @State private var mapSheetVisible = false
    @State private var selectedSheet: SheetType? = nil
    
    enum SheetType: Identifiable{
        case events
        case map
        case news
        var id: Int {
                    hashValue
                }
    }
    
    var body: some View {
        VStack {
            Image("cisl")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal)
            Button{
                selectedSheet = .events
            }label: {
                ZStack{
                    Image("car")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(25)
                    
                    Text("Events")
                        .foregroundStyle(.black)
                        .font(.largeTitle)
                        .bold()
                }
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            .padding()
            
            Button {
                selectedSheet = .map
            }label: {
                ZStack{
                    Image("map")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(25)
                    Text("Map")
                        .foregroundStyle(.black)
                        .font(.largeTitle)
                        .bold()
                }
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
            .padding()
            
            Button{
                selectedSheet = .news
            }label: {
                ZStack{
                    Image("flag")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(25)
                    
                    Text("News")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        .bold()
                }
            }
            .padding()
        }
        .sheet(item: $selectedSheet) { sheetType in
            switch sheetType {
            case .events:
                EventsView()
            case .map:
                MapView()
            case .news:
                NewsView()
            }
        }
    }
}
#Preview {
    HomeView()
}

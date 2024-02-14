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
            Button{
                selectedSheet = .events
            }label: {
                Text("Events")
            }
            .padding()
            
            Button {
                selectedSheet = .map
            }label: {
                Text("Map")
            }
            .padding()
            
            Button{
                selectedSheet = .news
            }label: {
                Text("News")
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

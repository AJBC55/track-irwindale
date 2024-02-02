//
//  HomeView.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 1/30/24.
//

import SwiftUI
import MapKit


struct HomeView: View {
    var dataService = DataService()
    @State var locations = [IrwindaleLocation]()
    @State var mapSheetVisible = false
    //34.110046, -117.987499
    
    
    var body: some View {
        GeometryReader{ proxy in
        VStack(alignment: .leading, spacing: 0){
            // Text("Irwindale Speedway")
            // .font(.largeTitle)
            //  .bold()
            //Image("cisl")
                //.resizable()
                //.aspectRatio(contentMode: .fit)
            //Divider()
               
            
            
               
                
            MapView(mapsheetVisible: Binding.constant(true))
                }
                }
                .onAppear{
                    locations = dataService.getLocationData()
                }
                .sheet(isPresented: $mapSheetVisible, content: {
                    MapView(mapsheetVisible: $mapSheetVisible)
                })
                
            
        }
    }

#Preview {
    HomeView()
}

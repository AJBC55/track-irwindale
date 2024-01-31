//
//  MapView.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 1/31/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var dataservice = DataService()
    @State var locations = [IrwindaleLocation]()
    @Binding var mapsheetVisible : Bool
   
    
    
    var body: some View {
        ZStack(alignment: .topLeading){
        
        Map(){
            ForEach(locations) { location in
                Marker(location.name, systemImage: location.imageName, coordinate: CLLocationCoordinate2D(latitude: location.lon, longitude: location.lat))
            }
            
        }
        .mapStyle(.hybrid(elevation: .realistic ))
        .cornerRadius(15)
        .ignoresSafeArea()
        
            Button{
                mapsheetVisible = false
            }label: {
                Image(systemName: "x.circle.fill")
                    .imageScale(.large)
                    .foregroundStyle(.white)
                
            }
            .padding(.leading,10)
            .padding(.top, 10)
            
    }
        
        .onAppear{
            locations = dataservice.getLocationData()
        }
    }
}

#Preview {
    MapView(mapsheetVisible: Binding.constant(true))
}

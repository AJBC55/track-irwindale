//
//  SmallMapView.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 1/31/24.
//

import SwiftUI
import MapKit

struct SmallMapView: View {
    var dataService = DataService()
   @State var locations = [IrwindaleLocation]()
    var body: some View {
        Map(){
            ForEach(locations) { location in
                Marker(location.name, systemImage: location.imageName, coordinate: CLLocationCoordinate2D(latitude: location.lon, longitude: location.lat))
            }
            
        }
        .mapStyle(.hybrid(elevation: .realistic ))
        .cornerRadius(15)
        .onAppear{
            locations = dataService.getLocationData()
        }
    }
}

#Preview {
    SmallMapView()
}

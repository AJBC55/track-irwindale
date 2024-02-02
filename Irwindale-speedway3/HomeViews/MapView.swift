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
    @State var loc : UUID?
    @State var item : IrwindaleLocation?
    @State var cam : MapCameraPosition = .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 34.10917, longitude: -117.98557), distance: 1000, heading: 294 , pitch: 40))

    var body: some View {
        ZStack(alignment: .topLeading){
            Map(position: $cam, selection: $loc){
                ForEach(locations) { location in
                    Marker(location.name, systemImage: location.imageName, coordinate: CLLocationCoordinate2D(latitude: location.lon, longitude: location.lat))
                        .tag(location.id)
                     

                }
            
            }
            .onChange(of: loc){oldValue, newValue in
                item = locations.first{ item in
                    item.id == loc
                    
                }
                
            }
            .mapStyle(.imagery(elevation: .realistic))
        .cornerRadius(15)
        .ignoresSafeArea()
           
            
            
    }
        .onAppear{
            locations = dataservice.getLocationData()
        }
    }
}
#Preview {
    MapView(mapsheetVisible: Binding.constant(true))
}

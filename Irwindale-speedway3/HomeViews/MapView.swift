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
    @State var cam : MapCameraPosition = .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 34.10917, longitude: -117.98557), distance: 1700, heading: 294 , pitch: 40))

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
                cam = .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: item?.lon ?? 34.10917 , longitude: item?.lat ?? -117.98557), distance: 300,heading : 294, pitch: 45))
            }
            .mapStyle(.imagery(elevation: .realistic))
        .cornerRadius(15)
        .ignoresSafeArea()
           
            
            Button{
               cam = .camera(MapCamera(centerCoordinate: CLLocationCoordinate2D(latitude: 34.10917, longitude: -117.98557), distance: 1700, heading: 294 , pitch: 40))
            }label: {
                Image(systemName: "arrowshape.turn.up.backward.fill")
                    .imageScale(.large)
                    .foregroundColor(.black.opacity(0.7))
                    
            }
    }
        .onAppear{
            locations = dataservice.getLocationData()
        }
    }
}
#Preview {
    MapView(mapsheetVisible: Binding.constant(true))
}

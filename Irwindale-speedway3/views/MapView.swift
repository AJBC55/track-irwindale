//
//  MapView.swift
//  Irwindale-speedway3
//
//  Created by Siddhu Sarvepally on 2/27/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var dataservice = DataService()
    @State private var viewMode = MapViewModel()
    @State var locations = [IrwindaleLocation]()
    @State var loc = UUID()
    @State var item : IrwindaleLocation?
    @State var cam = MKMapCamera(lookingAtCenter: CLLocationCoordinate2D(latitude: 34.10917, longitude: -117.98557), fromDistance: 1700, pitch: 40, heading: 294)
    let showsUserLocation = true
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            CustomMapView(configuration: CustomMapConfiguration(uuid: loc, cameraPosition: cam, showsUserLocation: showsUserLocation, annotations: locations))
                .edgesIgnoringSafeArea(.top)
                .onAppear {
                    viewMode.checkIfLocationEnabled()
                }
            
            
            Button {
               cam = MKMapCamera(lookingAtCenter: CLLocationCoordinate2D(latitude: 34.10917, longitude: -117.98557), fromDistance: 1700, pitch: 40, heading: 294)
            } label: {
                Image(systemName: "arrowshape.turn.up.backward.fill")
                    .imageScale(.large)
                    .foregroundColor(.black.opacity(1.5))
                    
            }
            .cornerRadius(15)
            .padding(.leading, 20.0)
        }
        .onAppear{
            locations =  dataservice.getLocationData()
        }
        
    }
}

#Preview {
    MapView()
}

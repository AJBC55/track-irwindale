//
//  infoView.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 4/4/24.
//

import SwiftUI

struct infoView: View {
    @State var selection: Int = 0
    var body: some View {
        VStack(spacing: 0.0){
            Picker("Saved?", selection: $selection){
                Text("Events").tag(0)
                Text("Saved").tag(1)
                
            }
            .pickerStyle(.palette)
            .padding(.horizontal)
            if selection == 0{
                EventsView()
            }else if selection == 1{
                SavedEventsView()
                
            }
        }
    }
}

#Preview {
    infoView()
}

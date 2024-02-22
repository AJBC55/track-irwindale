//
//  EventsView.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 1/30/24.
//

import SwiftUI

struct EventsView: View {
    var dataService = DataService()
   @State var events = [Event]()
    var body: some View {
        ScrollView{
       
                ForEach(events) { event in
                    VStack(alignment: .leading){
                        Spacer()
                        if let ImageUrl = event.eventImg{
                            // display image
                            AsyncImage(url: URL(string: ImageUrl)!){ image in
                            image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(15)
                                    
                                
                            } placeholder:{
                                Rectangle()
                                    .foregroundStyle(.gray)
                                    .aspectRatio(contentMode: .fill)
                                    .cornerRadius(15)
                                
                            }
                        }
                        Text(Helper.eventnameformat(eventName: event.eventName ?? ""))
                            .font(.title2)
                            .bold()
                        Text(event.eventDate ?? "")
                            .font(.headline)
                        Text(event.eventTime?[0] ?? "")
                            .font(.headline)
                        Text(event.eventDescription ?? "")
                            .font(.subheadline)
                        HStack{
                        if event.eventticketLink ?? "" != ""{
                            HStack{
                                Spacer()
                            
                            Button{
                                if let url = URL(string: event.eventticketLink!){
                                    UIApplication.shared.open(url)
                                }
                            }label: {
                                Text("Get Tickets")
                                    .foregroundStyle(.white)
                                    .bold()
                                    .padding(.horizontal,120)
                                    .padding(.vertical,6)
                                    .background(Color(.blue))
                            }       .cornerRadius(15)
                                Spacer()
                            }
                           
                            }
                             
                           
                        
                        }
                        Divider()
                    }
                    .padding(.horizontal)
                    
                
            }
                .padding(.vertical)
        }
        .task{
            events = dataService.geteventData()
        }
    }
        
}

#Preview {
    EventsView()
}

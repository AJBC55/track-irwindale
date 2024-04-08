//
//  SavedEventsView.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 4/4/24.
//

import SwiftUI

struct SavedEventsView: View {
    @State var events: [Event] = [Event]()
    var eventsRequests = Events()
    var body: some View {
        ScrollView{
            
                ForEach(events) { event in
                    VStack(alignment: .leading){
                        Spacer()
                        if let ImageUrl = event.img_link{
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
                        HStack{
                            Text(Helper.eventnameformat(eventName: event.name ?? ""))
                                .font(.title2)
                                .bold()
                            Spacer()
                            
                            Button{
                                Task{
                                    do{
                                        try  await eventsRequests.eventSave(id: event.id)
                                    }catch ServerError.invalidCredentials{
                                        
                                        
                                    }catch{
                                        print(error)
                                    }
                                }
                                
                            }label: {
                                if event.is_saved == true{
                                    Image(systemName: "bookmark.fill")
                                        .foregroundStyle(.yellow)
                                }
                                else{
                                    Image(systemName: "bookmark")
                                        .foregroundStyle(.black)
                                        
                                }
                                
                            }
                            .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/)
                            .padding()
                        }
                        
                        Text(event.event_start ??  "")
                            .font(.headline)
                        Text(event.description ?? "")
                            .font(.subheadline)
                        HStack{
                            if event.ticket_link ?? "" != ""{
                                HStack{
                                    Spacer()
                                    
                                    Button{
                                        if let url = URL(string: event.ticket_link!){
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
                
                
                .task{
                    do{
                        events =  try  await eventsRequests.getSavedEvents()
                    } catch{
                        print(error)
                    }
                }
            
          
        }
    }

    
}

#Preview {
    SavedEventsView()
}

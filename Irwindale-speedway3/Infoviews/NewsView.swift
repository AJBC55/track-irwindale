//
//  NewsView.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 2/13/24.
//

import SwiftUI

struct NewsView: View {
    var dataService = DataService()
   @State var newsItems = [News]()
    
    var body: some View {
        VStack{
        ForEach(newsItems) { item in
            VStack{
                Text(item.newsTitle ?? "")
            }
        }
    }
        
            .task {
                newsItems =  await dataService.getnewsData()
            }
    }
    
}

#Preview {
    NewsView()
}

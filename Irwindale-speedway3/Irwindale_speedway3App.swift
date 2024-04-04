//
//  Irwindale_speedway3App.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 1/30/24.
//

import SwiftUI

@main
struct Irwindale_speedway3App: App {
    var body: some Scene {
        WindowGroup {
            Main_View()
                .environmentObject(Global())
        }
    }
}

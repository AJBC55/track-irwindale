//
//  Global.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 4/3/24.
//

import Foundation
class Global: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var token: String = ""
}

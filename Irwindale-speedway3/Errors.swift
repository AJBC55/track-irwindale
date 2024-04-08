//
//  ServerError.swift
//  Irwindale-speedway3
//
//  Created by Andrew Chapman on 4/4/24.
//

import Foundation


enum ServerError:  Error{
    case invalidCredentials
    case dataConfict
    case notFound
    case urlCreationError
    case unexpectedStatusCode(Int)
    case decodingError
    case networkError(Error)
}


enum JsonError: Error{
    case decodingError(Error)
    case encodingError(Error)
}

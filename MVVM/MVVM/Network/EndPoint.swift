//
//  EndPoint.swift
//  MVVM
//
//  Created by Arken Sarsenov on 27.04.2024.
//

import Foundation

struct EndPoint {
    var path: String
}

extension EndPoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "jsonplaceholder.typicode.com"
        components.path = "/" + path
        
        guard let url = components.url else {
            preconditionFailure("Invalid url component \(components)")
        }
        return url
    }
}

extension EndPoint {
    static var user: Self {
        EndPoint(path: "users")
    }
}

//
//  NetworkDataFetch.swift
//  MVVM
//
//  Created by Arken Sarsenov on 28.04.2024.
//

import Foundation

class NetworkDataFetch {
    static let shared = NetworkDataFetch()
    
    private init() {}
    
    func fetchUsers(responce: @escaping ([User]?, NetworkError?) -> Void) {
        NetworkRequest.shared.getData { result in
            switch result {
            case .success(let data):
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    responce(users, nil)
                } catch let jsonError {
                    print("Failed to decode JSON",  jsonError)
                }
            case .failure(_):
                responce(nil, .cannotParsData)
            }
        }
    }
}

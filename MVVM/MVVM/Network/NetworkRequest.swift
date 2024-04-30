//
//  NetworkRequest.swift
//  MVVM
//
//  Created by Arken Sarsenov on 28.04.2024.
//

import Foundation

class NetworkRequest {
    static let shared = NetworkRequest()
    
    private init(){}
    
    func getData(complitionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        URLSession.shared.request(.user) { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    complitionHandler(.failure(.urlError))
                } else {
                    guard let data else { return }
                    complitionHandler(.success(data))
                }
            }
        }
    }
}
    

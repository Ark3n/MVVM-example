//
//  URLSession+Extention.swift
//  MVVM
//
//  Created by Arken Sarsenov on 28.04.2024.
//

import UIKit

extension URLSession {
    
    typealias Handler = (Data?, URLResponse?, Error?) -> Void
    
    @discardableResult
    func request(_ endpoint: EndPoint, handler: @escaping Handler) -> URLSessionDataTask {
        let task = dataTask(with: endpoint.url, completionHandler: handler)
        task.resume()
        return task
    }
}

//
//  DetailsViewModel.swift
//  MVVM
//
//  Created by Arken Sarsenov on 28.04.2024.
//

import Foundation

final class DetailsViewModel {

        let name: String
        let username: String
        let email: String
        let address: Address
        let phone: String
        let street: String
        let suite: String
        let city: String
    
    init(_ user: User) {
        self.name = user.name
        self.username = user.username
        self.email = user.email
        self.address = user.address
        self.phone = user.phone
        self.street = user.address.street
        self.suite = user.address.suite
        self.city = user.address.city
    }
}

//
//  Users.swift
//  MVVM
//
//  Created by Arken Sarsenov on 27.04.2024.
//

import Foundation

// MARK: - Users
struct User: Codable {
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
}

// MARK: - Address
struct Address: Codable {
    let street: String
    let suite: String
    let city: String
}

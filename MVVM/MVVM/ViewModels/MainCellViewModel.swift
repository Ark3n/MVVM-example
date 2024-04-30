//
//  MainCellViewModel.swift
//  MVVM
//
//  Created by Arken Sarsenov on 28.04.2024.
//

import Foundation

final class MainCellViewModel {
    var name: String
    var email: String
    
    init(_ user: User) {
        self.name = user.username
        self.email = user.email
    }
}

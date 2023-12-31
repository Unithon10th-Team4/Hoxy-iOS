//
//  UserViewModel.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

class UserViewModel: ObservableObject {
    static let shared = UserViewModel()
    @Published var currentUser: User?
    
    private init() {
        currentUser = nil
    }
    
    func setUserInformation(username: String) {
        self.currentUser = User.sample
        self.currentUser?.name = username
        
    }
}

//
//  HomeViewModel.swift
//  hoxy
//
//  Created by 제나 on 2023/09/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var currentUser: User?
    
    init() {
        self.fetchCurrentUser()
    }
    
    private func fetchCurrentUser() {
//    https://211e-2001-2d8-f1a2-5f9a-f4bb-2a2a-3711-91a0.ngrok-free.app/members/test
    }
    
    func sendEmojiMessage(emoji sendedEmoji: String) {
        
    }
}

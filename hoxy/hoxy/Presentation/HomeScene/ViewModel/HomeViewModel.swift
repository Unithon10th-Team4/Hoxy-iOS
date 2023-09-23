//
//  HomeViewModel.swift
//  hoxy
//
//  Created by 제나 on 2023/09/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var nearbyUsers = [NearUserResponse]()
    
    init() {
        self.fetchCurrentUser()
        self.fetchNearbyUser()
    }
}

extension HomeViewModel {
    private func fetchCurrentUser() {
        APIService.shared.currentUserData { user in
            self.currentUser = User(name: user.name,
                               fanclubId: user.fanclubId,
                               profileImageUrl: user.profileImageUrl,
                               point: user.point)
        }
    }
    
    private func fetchNearbyUser() {
        APIService.shared.nearbyUser { [weak self] nearUser in
            self?.nearbyUsers = nearUser
        }
    }
    
    func sendEmojiMessage(emoji sendedEmoji: String) {
        
    }
}

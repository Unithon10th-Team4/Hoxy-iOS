//
//  HomeViewModel.swift
//  hoxy
//
//  Created by 제나 on 2023/09/24.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var nearbyUsersUrl = [String]()
    @Published var count: Int = 2
    
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
    
    func fetchNearbyUser() {
        var urlList = [
            "https://cdn-ajggd.nitrocdn.com/kMoOFpDlsOVtlYJLrnSRNCQXaUFHZPTY/assets/images/optimized/rev-81d704b/shotkit.com/wp-content/uploads/bb-plugin/cache/cool-profile-pic-matheus-ferrero-landscape-6cbeea07ce870fc53bedd94909941a4b-zybravgx2q47.jpeg",
            "https://play-lh.googleusercontent.com/0SAFn-mRhhDjQNYU46ZwA7tz0xmRiQG4ZuZmuwU8lYmqj6zEpnqsee_6QDuhQ4ZofwXj=w240-h480-rw",
            "https://cdn-ajggd.nitrocdn.com/kMoOFpDlsOVtlYJLrnSRNCQXaUFHZPTY/assets/images/optimized/rev-81d704b/shotkit.com/wp-content/uploads/bb-plugin/cache/cool-profile-pic-matheus-ferrero-landscape-6cbeea07ce870fc53bedd94909941a4b-zybravgx2q47.jpeg",
            "https://play-lh.googleusercontent.com/0SAFn-mRhhDjQNYU46ZwA7tz0xmRiQG4ZuZmuwU8lYmqj6zEpnqsee_6QDuhQ4ZofwXj=w240-h480-rw"
        ]
        
        self.nearbyUsersUrl = urlList
    }
    
    func sendEmojiMessage(emoji sendedEmoji: String) {
        
    }
}

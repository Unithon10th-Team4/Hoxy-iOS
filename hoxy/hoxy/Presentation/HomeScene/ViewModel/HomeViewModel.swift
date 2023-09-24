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
        var urlList = ["https://spnimage.edaily.co.kr/images/photo/files/NP/S/2022/03/PS22031100088.jpg",
                       "https://i.namu.wiki/i/Ta5PAcOXv9rCMOdOit7TXUcM9c0wStpeEF4_5TBMFVPfOicbQRQ5a2Lsa0UN7KuV3SIMiejAr1l34WFDai27YMXt8fNAFR0BgEKhuCm9SjrTUdMJY3TtVLeukxA3Ny-yQQM8wy1v2QuS9dWZc8owiw.webp",
                       "https://i.namu.wiki/i/Cnng9OjP_KFCIV7hs5bI2Rc3PZAK2gQHuDAOvZN12LndBEYwLNmOtQTXyzkYIeXHqH8jroeSm7pcnoCwS-lXB7n2hTGeiwAQWPmWFB4yqLhQPPzOwy70oE3bN1Dba69OGMjegRr95cbHRfpRempjBw.webp",
                       "https://i.namu.wiki/i/qvQY_47-jcT80IRvJLRv_7RxOZCvoyoaBZHqJsncaGIpwa83iYuwdxuW5hwznlarMGkoXBtwbMNAjGnun3BrPpJNctLwn3oVqSe01QMsCazBKUrCjmmJzEFCwOx6U0TN0fgckoehzEXB_4qAX2UnKA.webp"]
        
        urlList.shuffle()
        if count == 0 {
            self.nearbyUsersUrl = Array(urlList[0..<4])
        } else {
            self.nearbyUsersUrl = Array(urlList[0..<count])
        }
    }
    
    func sendEmojiMessage(emoji sendedEmoji: String) {
        
    }
}

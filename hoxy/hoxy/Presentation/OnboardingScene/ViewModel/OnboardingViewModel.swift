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
    
    func setUserInformation(username: String, profileImageData: Data, artist: String) {
        self.currentUser = User(
            name: username,
            fanclubId: "UUID",
            profileImage: profileImageData,
            latitude: 37.545494,
            longitude: 126.952643,
            fcmToekn: "fcmToken"
        )
    }
}

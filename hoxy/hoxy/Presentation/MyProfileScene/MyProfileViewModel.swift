//
//  MyProfileViewModel.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/24.
//

import Foundation

class MyProfileViewModel: ObservableObject {
    @Published var userProfile: UserProfile = UserProfile(username: "", profileImagePath: "", fandomImagePath: "", fandomName: "", artistName: "", coins: 0)
    
    init() {
        self.updateUserProfile()
    }
}

extension MyProfileViewModel {
    private func updateUserProfile() {
        let testData = UserProfile(username: "몬엑짱짱",
                           profileImagePath: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZSUyMGltYWdlfGVufDB8fDB8fHww&w=1000&q=80",
                           fandomImagePath: "https://qph.cf2.quoracdn.net/main-qimg-bdca6c4b24202b4e6d94a361bb4a4450-lq",
                           fandomName: "아미",
                           artistName: "bts",
                           coins: 8369)
        self.userProfile = testData
    }
}

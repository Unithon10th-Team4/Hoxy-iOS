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
        
        APIService.shared.myProfile { [weak self] response in
            DispatchQueue.main.async {
                self?.userProfile.username = response.name
                self?.userProfile.profileImagePath = response.profileImageURL
                self?.userProfile.coins = response.point
            }
            self?.updateFandomProfile(id: response.fanclubID)
        }
    }
    
    private func updateFandomProfile(id: String) {
        APIService.shared.fanclubDetail(id: id) { [weak self] response in
            DispatchQueue.main.async {
                self?.userProfile.artistName = response.artist
                self?.userProfile.fandomName = response.name
                self?.userProfile.fandomImagePath = response.logoURL
            }
        }
    }
}

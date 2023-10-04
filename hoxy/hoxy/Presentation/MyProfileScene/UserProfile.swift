//
//  UserProfile.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/24.
//

import Foundation

struct UserProfile {
    var username: String
    var profileImagePath: String
    
    var fandomImagePath: String
    var fandomName: String
    var artistName: String
    var coins: Int
    
    static let sample = UserProfile(username: "youngmin", profileImagePath: "https://wallpapers.com/images/hd/cool-profile-picture-87h46gcobjl5e4xu.jpg", fandomImagePath: "https://image.blip.kr/v1/file/3f68699ef3ff5e622d129bd2d3426331", fandomName: "Bunnies", artistName: "뉴진스", coins: 34)
}

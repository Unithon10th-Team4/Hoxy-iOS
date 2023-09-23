//
//  UserProfileResponse.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/24.
//

import Foundation

struct UserProfileResponse: Codable {
    let name, fanclubID: String
    let profileImageURL: String
    let point: Int

    enum CodingKeys: String, CodingKey {
        case name
        case fanclubID = "fanclubId"
        case profileImageURL = "profileImageUrl"
        case point
    }
}

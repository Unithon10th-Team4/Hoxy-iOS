//
//  NearUserResponse.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/24.
//

import Foundation

struct NearUserResponse: Codable {
    let name: String
    let profileImageURL: String

    enum CodingKeys: String, CodingKey {
        case name
        case profileImageURL = "profileImageUrl"
    }
}

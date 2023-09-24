//
//  User.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

struct User: Codable {
    var name: String
    let fanclubId: String
    let profileImageUrl: String
    var point: Int
    enum CodingKeys: String, CodingKey {
        case name
        case fanclubId
        case profileImageUrl
        case point
    }
    
    static let testUser = User(name: "test", fanclubId: "11297064-67db-4175-9c38-0f5bd3ad46d9", profileImageUrl: "https://plowithmebucket.s3.ap-northeast-2.amazonaws.com/8679704b-aae0-4990-b05b-0bf2459e6fd9aespa.png", point: 10)
}

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
}

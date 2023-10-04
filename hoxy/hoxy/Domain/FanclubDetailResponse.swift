//
//  FanclubDetailResponse.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/24.
//

import Foundation

struct FanclubDetailResponse: Codable {
    let fanclubID, name: String
    let logoURL: String
    let fanclubInfo, artist: String
    let artistURL: String
    let point: Int

    enum CodingKeys: String, CodingKey {
        case fanclubID = "fanclubId"
        case name
        case logoURL = "logoUrl"
        case fanclubInfo, artist
        case artistURL = "artistUrl"
        case point
    }
}

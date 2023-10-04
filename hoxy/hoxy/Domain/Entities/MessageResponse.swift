//
//  Message.swift
//  hoxy
//
//  Created by 제나 on 2023/09/24.
//

import Foundation


struct MessageResponse: Codable, Hashable {
    let sender: String
    let contents: String
    let timestamp: String
    enum CodingKeys: String, CodingKey {
        case sender
        case contents
        case timestamp = "timeStamp"
    }
}

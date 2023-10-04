//
//  RankingListItem.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import Foundation

struct Fandom: Identifiable {
    
    /// UUID
    let id: String
    let logoImagePath: String
    let fandomName: String
    let fandomDescription: String
    let coins: Int
    let artistName: String
    let artistImagePath: String
}

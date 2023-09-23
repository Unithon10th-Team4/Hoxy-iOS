//
//  File.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import Foundation

class RankingViewModel: ObservableObject {
    
    @Published var topFandomList = [Fandom].init(repeating: Fandom(id: "", logoImagePath: "", fandomName: "", fandomDescription: "", coins: 0, artistName: "", artistImagePath: ""), count: 10)
    let dateDescription: String
    
    init() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM월 dd일 a HH시 까지"

        self.dateDescription = dateFormatter.string(from: Date())
        self.getFandomList()
    }
}

// MARK: API
extension RankingViewModel {

    /// 팬덤 랭킹 불러오기
    private func getFandomList() {
        
        APIService.shared.fanclubRanking { [weak self] responseList in
            var fandomList = responseList.map {
                Fandom(id: $0.fanclubID, logoImagePath: $0.logoURL, fandomName: $0.name, fandomDescription: $0.fanclubInfo, coins: $0.point, artistName: $0.artist, artistImagePath: $0.artistURL)            }
            if fandomList.count < 4 {
                let emptyList = [Fandom].init(repeating: Fandom(id: "", logoImagePath: "", fandomName: "", fandomDescription:"", coins: 0, artistName: "", artistImagePath: ""), count: 4 - fandomList.count)
                fandomList.append(contentsOf: emptyList)
            }
            self?.topFandomList = fandomList
        }
    }
    
    func getFandomDetail(fandom: Fandom) -> FandomDetail {
        return FandomDetail(logoImagePath: fandom.logoImagePath, fandomName: fandom.fandomName, fandomDescription: fandom.fandomDescription, coins: fandom.coins, artistName: fandom.artistName, artistImagePath: fandom.artistImagePath)
    }
}


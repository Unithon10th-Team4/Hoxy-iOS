//
//  File.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import Foundation

class RankingViewModel: ObservableObject {
    
    @Published var topFandomList = [Fandom].init(repeating: Fandom(id: "", logoImagePath: "", fandomName: "", artistName: "", coins: 0), count: 10)
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
            let fandomList = responseList.map {
                Fandom(id: $0.fanclubID, logoImagePath: $0.logoURL, fandomName: $0.name, artistName: $0.artist, coins: $0.point)
            }
            self?.topFandomList = fandomList
        }
    }
    
    func getFandomDetail(id: String) -> FandomDetail {
        return FandomDetail(logoImagePath: "https://qph.cf2.quoracdn.net/main-qimg-bdca6c4b24202b4e6d94a361bb4a4450-lq",
                            fandomName: "아미",
                            fandomDescription: "공식 팬덤입니다",
                            coins: 1242,
                            artistName: "bts",
                            artistImagePath: "https://www.billboard.com/wp-content/uploads/2022/01/bts-2019-grammys-billboard-1548.jpg?w=875&h=583&crop=1")
    }
}


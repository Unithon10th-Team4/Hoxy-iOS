//
//  File.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import Foundation

class RankingViewModel: ObservableObject {
    
    @Published var topFandomList = [Fandom]()
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
        
        // TODO: 서버 API 작업 완료 후 서버에서 받아오도록 수정
        let testData: [Fandom] = [
            Fandom(id: "1", logoImagePath: "https://qph.cf2.quoracdn.net/main-qimg-bdca6c4b24202b4e6d94a361bb4a4450-lq", fandomName: "아미", artistName: "BTS", coins: 10213),
            Fandom(id: "2", logoImagePath: "https://qph.cf2.quoracdn.net/main-qimg-bdca6c4b24202b4e6d94a361bb4a4450-lq", fandomName: "유애나", artistName: "아이유", coins: 9124),
            Fandom(id: "3", logoImagePath: "https://qph.cf2.quoracdn.net/main-qimg-bdca6c4b24202b4e6d94a361bb4a4450-lq", fandomName: "엑소엘", artistName: "엑소", coins: 8213),
            Fandom(id: "4", logoImagePath: "https://qph.cf2.quoracdn.net/main-qimg-bdca6c4b24202b4e6d94a361bb4a4450-lq", fandomName: "피어나", artistName: "르세라핌", coins: 7213),
            Fandom(id: "5", logoImagePath: "https://qph.cf2.quoracdn.net/main-qimg-bdca6c4b24202b4e6d94a361bb4a4450-lq", fandomName: "네버랜드", artistName: "아이들", coins: 6213),
            Fandom(id: "6", logoImagePath: "https://qph.cf2.quoracdn.net/main-qimg-bdca6c4b24202b4e6d94a361bb4a4450-lq", fandomName: "마이", artistName: "에스파", coins: 5213),
            Fandom(id: "7", logoImagePath: "https://qph.cf2.quoracdn.net/main-qimg-bdca6c4b24202b4e6d94a361bb4a4450-lq", fandomName: "샤이니 월드", artistName: "샤이니", coins: 4213),
            Fandom(id: "8", logoImagePath: "https://qph.cf2.quoracdn.net/main-qimg-bdca6c4b24202b4e6d94a361bb4a4450-lq", fandomName: "이너써클", artistName: "위너", coins: 3213),
            Fandom(id: "9", logoImagePath: "https://qph.cf2.quoracdn.net/main-qimg-bdca6c4b24202b4e6d94a361bb4a4450-lq", fandomName: "몬베베", artistName: "몬스터엑스", coins: 2213),
            Fandom(id: "10", logoImagePath: "https://qph.cf2.quoracdn.net/main-qimg-bdca6c4b24202b4e6d94a361bb4a4450-lq", fandomName: "스테이", artistName: "스트레이키즈", coins: 1213)
        ]
        
        self.topFandomList = testData
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


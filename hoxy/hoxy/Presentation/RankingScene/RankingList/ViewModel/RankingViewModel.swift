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
            Fandom(id: "1", logoImagePath: "", fandomName: "아미", artistName: "BTS", coins: 10213),
            Fandom(id: "2", logoImagePath: "", fandomName: "유애나", artistName: "아이유", coins: 9124),
            Fandom(id: "3", logoImagePath: "", fandomName: "엑소엘", artistName: "엑소", coins: 8213),
            Fandom(id: "4", logoImagePath: "", fandomName: "피어나", artistName: "르세라핌", coins: 7213),
            Fandom(id: "5", logoImagePath: "", fandomName: "네버랜드", artistName: "아이들", coins: 6213),
            Fandom(id: "6", logoImagePath: "", fandomName: "마이", artistName: "에스파", coins: 5213),
            Fandom(id: "7", logoImagePath: "", fandomName: "샤이니 월드", artistName: "샤이니", coins: 4213),
            Fandom(id: "8", logoImagePath: "", fandomName: "이너써클", artistName: "위너", coins: 3213),
            Fandom(id: "9", logoImagePath: "", fandomName: "몬베베", artistName: "몬스터엑스", coins: 2213),
            Fandom(id: "10", logoImagePath: "", fandomName: "스테이", artistName: "스트레이키즈", coins: 1213)
        ]
    }
}


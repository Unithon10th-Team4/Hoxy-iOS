//
//  RankingView.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

struct RankingView: View {
    
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
    var body: some View {
        
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            NavigationView {
                VStack(alignment: .leading) {
                    
                    // 상단 label
                    VStack(alignment: .leading, spacing: 10) {
                        Text("오늘의 TOP 팬덤")
                            .font(.title)
                        Text("9월 23일 오전 7시까지 누적된 코인으로 업데이트 되었습니다.")
                            .font(.body)
                    }
                    .padding()
                    
                    // 1 ~ 3위
                    HStack {
                        Spacer()
                        NavigationLink {
                            RankingDetailView(logoImage: UIImage(named: "background")!, fandomName: "유애나", fandomDescription: "Dscroption", coins: 2314)
                        } label: {
                            RankingTopView(logoImage: UIImage(named: "background")!, rank: 2, fandomName: "유애나", coins: 2314)
                        }
                        
                        Spacer()
                        
                        NavigationLink {
                            RankingDetailView(logoImage: UIImage(named: "background")!, fandomName: "아미", fandomDescription: "Dscroption", coins: 2314)
                        } label: {
                            RankingTopView(logoImage: UIImage(named: "background")!, rank: 1, fandomName: "아미", coins: 2314)
                        }

                        Spacer()
                        
                        NavigationLink {
                            RankingDetailView(logoImage: UIImage(named: "background")!, fandomName: "몬베베", fandomDescription: "Dscroption", coins: 2314)
                        } label: {
                            RankingTopView(logoImage: UIImage(named: "background")!, rank: 3, fandomName: "몬베베", coins: 2314)
                        }

                        Spacer()
                    }.padding()
                    
                    // 4위 ~ 리스트
                    List(items[3...], id: \.self) { item in
                        
                        let image = UIImage(named: "background")!
                        ZStack(alignment: .leading) {
                            NavigationLink {
                                RankingDetailView(logoImage: UIImage(named: "background")!, fandomName: item, fandomDescription: "Description", coins: 32)
                            } label: {
                                EmptyView()
                            }.opacity(0)
                            
                            RankingRow(uiImage: image, rank: 2, fandomName: item, artistName: "엑소", coins: 1234)
                        }
                    }
                    .listStyle(.plain)
                }
            }

        }
    }
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}

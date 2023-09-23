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
            Image("bg_yellow")
                .resizable()
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
                            RankingDetailView(fandomName: "유애나", coins: 2314, artistName: "아이유")
                        } label: {
                            RankingTopView(logoImage: UIImage(named: "background")!, rank: 2, fandomName: "유애나", coins: 2314)
                        }
                        
                        Spacer()
                        
                        NavigationLink {
                            RankingDetailView(fandomName: "아미", coins: 2314, artistName: "방탄소년단")
                        } label: {
                            RankingTopView(logoImage: UIImage(named: "background")!, rank: 1, fandomName: "아미", coins: 2314)
                        }

                        Spacer()
                        
                        NavigationLink {
                            RankingDetailView(fandomName: "몬베베", coins: 2314, artistName: "몬스타엑스")
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
                                RankingDetailView(fandomName: item, coins: 32, artistName: item)
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

//
//  RankingView.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

struct RankingView: View {
    
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    @ObservedObject var viewModel = RankingViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Image("bg_red")
                    .resizable()
                    .ignoresSafeArea()
                
                    VStack(alignment: .leading) {
                        
                        // 상단 label
                        VStack(alignment: .leading, spacing: 10) {
                            Text("오늘의 TOP 팬덤")
                                .font(.title)
                            Text("\(viewModel.dateDescription) 누적된 코인으로 업데이트 되었습니다.")
                                .font(.body)
                        }
                        .padding()
                        
                        // 1 ~ 3위
                        HStack {
                            Spacer()
                            NavigationLink {
                                RankingDetailView(fandomName: "유애나", coins: 2314, artistName: "아이유")
                            } label: {
                                RankingTopView(fandom: viewModel.topFandomList[1], rank: 2)
                            }
                            
                            Spacer()
                            
                            NavigationLink {
                                RankingDetailView(fandomName: "아미", coins: 2314, artistName: "방탄소년단")
                            } label: {
                                RankingTopView(fandom: viewModel.topFandomList[0], rank: 1)
                            }

                            Spacer()
                            
                            NavigationLink {
                                RankingDetailView(fandomName: "몬베베", coins: 2314, artistName: "몬스타엑스")
                            } label: {
                                RankingTopView(fandom: viewModel.topFandomList[2], rank: 3)
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
                                
                                RankingRow(fandom: Fandom(id: "dd", logoImagePath: "dd", fandomName: item, artistName: "몬스터엑스", coins: 3413), rank: 3)
                            }
                        }
                        .listStyle(.plain)
                        .background(.clear)
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

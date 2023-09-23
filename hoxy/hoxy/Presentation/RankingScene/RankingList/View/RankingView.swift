//
//  RankingView.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

struct RankingView: View {
    
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
                                .fontWeight(.semibold)
                            Text("\(viewModel.dateDescription) 누적된 코인으로 업데이트 되었습니다.")
                                .font(.body)
                        }
                        .padding()
                        
                        // 1 ~ 3위
                        HStack {
                            Spacer()
                            NavigationLink {
                                RankingDetailView(model: self.viewModel.getFandomDetail(fandom: viewModel.topFandomList[1]))
                            } label: {
                                RankingTopView(fandom: viewModel.topFandomList[1], rank: 2)
                            }
                            
                            Spacer()
                            
                            NavigationLink {
                                RankingDetailView(model: self.viewModel.getFandomDetail(fandom: viewModel.topFandomList[0]))
                            } label: {
                                RankingTopView(fandom: viewModel.topFandomList[0], rank: 1)
                            }

                            Spacer()
                            
                            NavigationLink {
                                RankingDetailView(model: self.viewModel.getFandomDetail(fandom: viewModel.topFandomList[2]))
                            } label: {
                                RankingTopView(fandom: viewModel.topFandomList[2], rank: 3)
                            }

                            Spacer()
                        }.padding()
                        
                        // 4위 ~ 리스트
                        List(Array(viewModel.topFandomList[3...].enumerated()), id:\.element.id) { index, fandom in
                            
                            ZStack(alignment: .leading) {
                                NavigationLink {
                                    RankingDetailView(model: self.viewModel.getFandomDetail(fandom: fandom))
                                } label: {
                                    EmptyView()
                                }.opacity(0)
                                
                                RankingRow(fandom: fandom, rank: index + 4)
                            }
                        }
                        .listStyle(.plain)
                        .background(.clear)
                    }
                }

            }
        .accentColor(.black)
    }
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}

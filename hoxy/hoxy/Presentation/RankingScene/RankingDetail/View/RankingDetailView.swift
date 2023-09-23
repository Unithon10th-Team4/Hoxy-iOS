//
//  RankingDetailView.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import SwiftUI

struct RankingDetailView: View {
    
    let model: FandomDetail
    
    var body: some View {
        ZStack {
            Image("bg_yellow")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                // 팬덤정보 + 누적 코인
                HStack {
                    Spacer()
                    VStack (spacing: 10) {
                        Spacer()
                            .frame(height: 60)
                        
                        Text("팬덤 \(model.fandomName)")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(model.fandomDescription)
                            .font(.body)
                            .foregroundColor(.gray)
                        
                        Spacer()
                            .frame(height: 10)
                        
                        RankingDetailCoinView(coins: model.coins)
                        
                        Spacer()
                            .frame(height: 30)
                    }
                    Spacer()
                }
                .modifier(RectangleContainerModifier())
                .overlay(alignment: .top) {
                    
                    AsyncImage(url: URL(string: model.logoImagePath)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .modifier(CircleImageModifier())
                            .offset(CGSize(width: 0, height: -50))
                    } placeholder: {
                        ProgressView()
                            .frame(width: 100, height: 100)
                            .modifier(CircleImageModifier())
                            .offset(CGSize(width: 0, height: -50))
                    }
                }
                
                // 아티스트 사진
                VStack(spacing: 0) {
                    HStack {
                        Text("아티스트")
                            .font(.headline)
                            
                        Text(model.artistName)
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    
                    Rectangle()
                        .frame(width: .infinity, height: 1)
                        .foregroundColor(.black)
                    
                    AsyncImage(url: URL(string: model.artistImagePath)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: .infinity, height: 160)
                            .modifier(CornerRadiusStyle(radius: 15, corners: [.bottomLeft, .bottomRight]))
                    } placeholder: {
                        ProgressView()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: .infinity, height: 160)
                            .modifier(CornerRadiusStyle(radius: 15, corners: [.bottomLeft, .bottomRight]))
                    }
                }
                .modifier(RectangleContainerModifier())
            }
            .padding(EdgeInsets(top: 100, leading: 50, bottom: 100, trailing: 50))
        }
    }
}

struct RankingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RankingDetailView(model: FandomDetail(logoImagePath: "", fandomName: "몬베베", fandomDescription: "공식팬덤", coins: 1234, artistName: "몬스터엑스", artistImagePath: ""))
    }
}

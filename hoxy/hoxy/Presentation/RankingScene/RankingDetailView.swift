//
//  RankingDetailView.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import SwiftUI

struct RankingDetailView: View {
    
    let logoImage: UIImage
    let fandomName: String
    let fandomDescription: String
    let coins: Int
    
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                
                // 팬덤정보 + 누적 코인
                HStack {
                    Spacer()
                    VStack (spacing: 10) {
                        Spacer()
                            .frame(height: 60)
                        
                        Text("팬덤 \(fandomName)")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text(fandomDescription)
                            .font(.body)
                            .foregroundColor(.gray)
                        
                        Spacer()
                            .frame(height: 10)
                        
                        RankingDetailCoinView(coins: coins)
                        
                        Spacer()
                            .frame(height: 30)
                    }
                    Spacer()
                }
                .modifier(RectangleContainerModifier())
                .overlay(alignment: .top) {
                    Image(uiImage: logoImage)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .modifier(CircleImageModifier())
                        .offset(CGSize(width: 0, height: -50))
                }
                
            }
            .padding(EdgeInsets(top: 100, leading: 50, bottom: 100, trailing: 50))
        }
    }
}

struct RankingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RankingDetailView(logoImage: UIImage(named: "background")!,
            fandomName: "몬베베", fandomDescription: "몬스타 엑스 공식 팬클럽", coins: 10873)
    }
}

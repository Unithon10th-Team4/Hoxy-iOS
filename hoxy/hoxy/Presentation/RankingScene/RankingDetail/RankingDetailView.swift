//
//  RankingDetailView.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import SwiftUI

struct RankingDetailView: View {
    
    // TODO: ViewModel 생성 후 수정
    let logoImage: UIImage = UIImage(named: "fandom")!
    let fandomName: String
    let fandomDescription: String = "공식 팬클럽"
    let coins: Int
    let artistName: String
    let artistImage: UIImage = UIImage(named: "sample_profile1")!
    
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
                
                // 아티스트 사진
                VStack(spacing: 0) {
                    HStack {
                        Text("아티스트")
                            .font(.headline)
                            
                        Text(artistName)
                            .font(.headline)
                            .fontWeight(.semibold)
                    }
                    .padding()
                    
                    Rectangle()
                        .frame(width: .infinity, height: 1)
                        .foregroundColor(.black)
                    
                    Image(uiImage: artistImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: .infinity, height: 160)
                        .modifier(CornerRadiusStyle(radius: 15, corners: [.bottomLeft, .bottomRight]))
                }
                .modifier(RectangleContainerModifier())
            }
            .padding(EdgeInsets(top: 100, leading: 50, bottom: 100, trailing: 50))
        }
    }
}

struct RankingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RankingDetailView(fandomName: "몬베베", coins: 3125, artistName: "몬스타엑스")
    }
}

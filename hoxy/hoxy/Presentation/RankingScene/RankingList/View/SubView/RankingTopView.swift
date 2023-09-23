//
//  RankingTopView.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import SwiftUI

struct RankingTopView: View {

    let fandom: Fandom
    let rank: Int
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: fandom.logoImagePath)) { image in
                image
                    .resizable()
                    .modifier(CircleImageModifier())
                    .frame(width: (rank == 1 ? 100 : 80), height: (rank == 1 ? 100 : 80))
                    .modifier(BottomTrailingBadgeModifier(text: String(rank)))
            } placeholder: {
                ProgressView()
                    .frame(width: (rank == 1 ? 100 : 80), height: (rank == 1 ? 100 : 80))
                    .modifier(CircleImageModifier())
                    .modifier(BottomTrailingBadgeModifier(text: String(rank)))
            }
            
            Text(fandom.fandomName)
                .font((rank == 1 ? .title2 : .body))
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            Text("\(fandom.coins) 코인")
                .font(.headline)
                .foregroundColor(.gray)
        }
    }
    
}

struct RankingTopView_Previews: PreviewProvider {
    static var previews: some View {
        RankingTopView(fandom: Fandom(id: "dd", logoImagePath: "https://qph.cf2.quoracdn.net/main-qimg-bdca6c4b24202b4e6d94a361bb4a4450-lq", fandomName: "몬베베", artistName: "몬스터엑스", coins: 1342), rank: 1)
    }
}

//
//  RankingTopView.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import SwiftUI

struct RankingTopView: View {
    
    let logoImage: UIImage
    let rank: Int
    let fandomName: String
    let coins: Int
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(named: "background")!)
                .resizable()
                .modifier(CircleImageModifier())
                .frame(width: (rank == 1 ? 100 : 80), height: (rank == 1 ? 100 : 80))
            .modifier(BottomTrailingBadgeModifier(text: String(rank)))
            
            Text(fandomName)
                .font((rank == 1 ? .title2 : .body))
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            Text("\(coins) 코인")
                .font(.headline)
                .foregroundColor(.gray)
        }
    }
    
}

struct RankingTopView_Previews: PreviewProvider {
    static var previews: some View {
        RankingTopView(logoImage: UIImage(named: "background")!, rank: 1, fandomName: "몬베베", coins: 1534)
    }
}

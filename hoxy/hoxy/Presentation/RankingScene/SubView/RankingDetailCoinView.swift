//
//  RankingDetailCoinView.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import SwiftUI

struct RankingDetailCoinView: View {
    
    let coins: Int
    
    var body: some View {
        
        HStack {
            Text("누적 코인")
                .font(.title3)
            
            Text("\(coins)C")
                .font(.title)
                .fontWeight(.semibold)
        }
        .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
        .background {
            Color.white
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.black)
                        .offset(CGSize(width: 5, height: 5))
                }
        }
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(.black, lineWidth: 1)
        }
        
    }
}

struct RankingDetailCoinVIew_Previews: PreviewProvider {
    static var previews: some View {
        RankingDetailCoinView(coins: 10765)
    }
}

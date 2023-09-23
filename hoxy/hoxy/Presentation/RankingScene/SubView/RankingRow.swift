//
//  RankingRow.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import SwiftUI

struct RankingRow: View {
    
    let uiImage: UIImage
    let rank: Int
    let fandomName: String
    let artistName: String
    let coins: Int
    
    var body: some View {
        HStack {
            Image(uiImage: uiImage)
                .resizable()
                .modifier(CircleImageModifier())
                .frame(width: 54, height: 54)
                .modifier(BottomTrailingBadgeModifier(strokeColor: .clear, text: String(rank)))
            
            VStack(alignment: .leading) {
                Text(fandomName)
                    .font(.headline)
                    .fontWeight(.bold)
                Text("\(artistName) | \(coins) 코인")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(Color(hex: 0xD9D9D9))
                .overlay(alignment: .center) {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 4.57, height: 9.14)
                        .foregroundColor(Color(hex: 0x999999))
                        
                }
        }
        .padding()
    }
}

struct RankingRow_Previews: PreviewProvider {
    static var previews: some View {
        RankingRow(uiImage: UIImage(named: "background")!, rank: 3, fandomName: "엑소엘", artistName: "엑소", coins: 1235)
            .background(Color(hex: 0xF3F4F6))
    }
}

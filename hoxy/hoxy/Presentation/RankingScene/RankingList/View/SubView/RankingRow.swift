//
//  RankingRow.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import SwiftUI

struct RankingRow: View {
    
    let fandom: Fandom
    let rank: Int
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(named: "background")!)
                .resizable()
                .modifier(CircleImageModifier())
                .frame(width: 54, height: 54)
                .modifier(BottomTrailingBadgeModifier(strokeColor: .clear, text: String(rank)))
            
            VStack(alignment: .leading) {
                Text(fandom.fandomName)
                    .font(.headline)
                    .fontWeight(.bold)
                Text("\(fandom.artistName) | \(fandom.coins) 코인")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.clear)
                .overlay {
                    Circle()
                        .stroke(.black, lineWidth: 1)
                        .frame(width: 20, height: 20)
                }
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
        let fandom = Fandom(id: "dd", logoImagePath: "dd", fandomName: "몬베베", artistName: "몬스터엑스", coins: 3413)
        RankingRow(fandom: fandom, rank: 3)
    }
}

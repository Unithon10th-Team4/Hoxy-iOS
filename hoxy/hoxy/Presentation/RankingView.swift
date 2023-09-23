//
//  RankingView.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

struct RankingView: View {
    
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]
    
    var body: some View {
        
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                
                // 상단 label
                VStack(alignment: .leading, spacing: 10) {
                    Text("오늘의 TOP 팬덤")
                        .font(.title)
                    Text("9월 23일 오전 7시까지 누적된 코인으로 업데이트 되었습니다.")
                        .font(.body)
                }
                .padding()
                
                // 1 ~ 3위
                HStack {
                    Spacer()
                    Image(uiImage: UIImage(named: "background")!)
                        .resizable()
                        .modifier(CircleImageModifier())
                        .frame(width: 80, height: 80)
                        .modifier(BottomTrailingBadgeModifier(text: "2"))
                    
                    Spacer()
                    
                    Image(uiImage: UIImage(named: "background")!)
                        .resizable()
                        .modifier(CircleImageModifier())
                        .frame(width: 100, height: 100)
                        .modifier(BottomTrailingBadgeModifier(text: "1"))
                    Spacer()
                    
                    Image(uiImage: UIImage(named: "background")!)
                        .resizable()
                        .modifier(CircleImageModifier())
                        .frame(width: 80, height: 80)
                        .modifier(BottomTrailingBadgeModifier(text: "3"))
                    Spacer()
                }.padding()
                
                // 4위 ~ 리스트
                List(items, id: \.self) { item in
                    Text(item)
                        .frame(minHeight: 100)
                }.listStyle(.plain)
            }

        }
    }
}

struct RankingView_Previews: PreviewProvider {
    static var previews: some View {
        RankingView()
    }
}

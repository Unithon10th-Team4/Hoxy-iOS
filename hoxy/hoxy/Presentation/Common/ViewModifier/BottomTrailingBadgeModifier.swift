//
//  BottomTrailingBadgeModifier.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import SwiftUI

struct BottomTrailingBadgeModifier: ViewModifier {
    
    let color: Color
    let strokeColor: Color
    let text: String
    
    init(color: Color = Color.white, strokeColor: Color = Color.black, text: String) {
        self.color = color
        self.strokeColor = strokeColor
        self.text = text
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .bottomTrailing) {
                Circle()
                    .foregroundColor(color)
                    .frame(width:20, height: 20)
                    .overlay(alignment: .center) {
                        ZStack {
                            Circle()
                                .stroke(strokeColor, lineWidth: 1)
                                .frame(width:20, height: 20)
                            Text(text)
                                .font(.body)
                                .foregroundColor(.black)
                        }
                    }
             }
    }
}



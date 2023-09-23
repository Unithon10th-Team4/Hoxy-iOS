//
//  RectangleContainerModifier.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import SwiftUI

struct RectangleContainerModifier: ViewModifier {
    
    let cornerRadius: CGFloat
    let backgroundColor: Color
    let borderColor: Color
    let borderWidth: CGFloat
      
    func body(content: Content) -> some View {
        
        content
            .background {
                backgroundColor
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
                    .overlay {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(borderColor, lineWidth: borderWidth)
                    }
            }
    }
    
    init(cornerRadius: CGFloat = 15, backgroundColor: Color = .white, borderColor: Color = .black, borderWidth: CGFloat = 1) {
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
      
}

//
//  CircleImageModifier.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import SwiftUI

struct CircleImageModifier: ViewModifier {
      
    func body(content: Content) -> some View {
        content
            .clipShape(Circle())
            .overlay(Circle().stroke(.black, lineWidth: 1))
    }
      
}

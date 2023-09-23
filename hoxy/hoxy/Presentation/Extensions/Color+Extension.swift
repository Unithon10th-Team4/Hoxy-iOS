//
//  Color+Extension.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

extension Color {
    // Usage: Color(hex: 0xFF3103)
    init(hex: UInt, alpha: Double = 1.0) {
            let red = Double((hex >> 16) & 0xff) / 255.0
            let green = Double((hex >> 8) & 0xff) / 255.0
            let blue = Double(hex & 0xff) / 255.0
            self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}

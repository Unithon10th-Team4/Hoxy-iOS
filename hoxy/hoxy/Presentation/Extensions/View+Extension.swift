//
//  View+Extension.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}

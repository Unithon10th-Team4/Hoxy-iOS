//
//  OnboardingView.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView {
            SettingUsernameView()
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

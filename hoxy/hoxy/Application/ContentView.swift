//
//  ContentView.swift
//  hoxy
//
//  Created by Daegeon Choi on 2023/09/23.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    @EnvironmentObject var viewModel: UserViewModel
    var body: some View {
        TabView {
            RankingView()
                .tabItem {
                    Label(
                        "랭킹",
                        systemImage: "star.fill")
                }
            HomeView()
                .tabItem {
                    Label(
                        "탐색",
                        systemImage: "house.fill")
                }
            MyProfileView()
                .tabItem {
                    Label(
                        "마이",
                        systemImage: "person.fill")
                }
        }
        .accentColor(.black)
        .fullScreenCover(isPresented: .constant(viewModel.currentUser == nil)) {
            OnboardingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

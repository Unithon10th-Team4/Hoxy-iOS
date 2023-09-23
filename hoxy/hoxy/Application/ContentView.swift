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
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("탐색", systemImage: "house.fill")
                }
            RankingView()
                .tabItem {
                    Label("랭킹", systemImage: "star.fill")
                }
            MyProfileView(username: "몬스터엑스최고",
                          profileImage: UIImage(named: "myImage")!,
                          fandomImage: UIImage(named: "fandom")!,
                          fandomName: "몬베베",
                          artistName: "몬스터엑스",
                          coins: 1234)
                .tabItem {
                    Label("마이", systemImage: "person.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

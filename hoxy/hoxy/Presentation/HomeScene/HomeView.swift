//
//  ExploreView.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

enum RadarState {
    case active
    case inactive
}

struct HomeView: View {
    @State var selectedEmoji: Emoji?
    @State private var isEmojiSelected = false
    @State private var showEmojiSheet = false
    
    // properties for emoji animation
    @State private var animatingEmojiScale = CGFloat.zero
    @State private var animatingEmojiOpacity = 1.0
    
    // properties for toast message
    @State private var toastingMessageOpacity = 1.0
    @State private var toastMessageY = CGFloat(-20)
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .scaleEffect(1.2)
            
            ProfileInRadarView(
                radarResourceName: "myRadar",
                imageResourceName: "myImage",
                radarState: .active
            )
            ProfileInRadarView(
                radarResourceName: "anotherRadar",
                imageResourceName: "anotherImage",
                radarState: showEmojiSheet ? .active : .inactive
            )
            .overlay {
                EmojiSheetView(selectedEmoji: $selectedEmoji)
                    .offset(y: 70)
                    .opacity(showEmojiSheet ? 1.0 : 0.0)
            }
            .onTapGesture {
                showEmojiSheet.toggle()
            }
            .offset(x: 80, y: -200)
            
            // MARK: - Show animation when emoji selected
            if isEmojiSelected,
               let selectedEmoji = selectedEmoji {
                Image(selectedEmoji.rawValue)
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(animatingEmojiScale)
                    .opacity(animatingEmojiOpacity)
                    .shadow(radius: 4)
                    .onAppear {
                        withAnimation(.linear(duration: 1.0)) {
                            animatingEmojiScale = CGFloat(0.5)
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation(.linear(duration: 1.0)) {
                                animatingEmojiOpacity = Double.zero
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            animatingEmojiScale = CGFloat.zero
                        }
                    }
                VStack {
                    Spacer()
                    ToastMessageView()
                        .offset(y: toastMessageY)
                }
                .opacity(toastingMessageOpacity)
                .onAppear {
                    withAnimation(.linear(duration: 0.5)) {
                        toastMessageY = CGFloat(-80)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation(.linear(duration: 1.0)) {
                            toastingMessageOpacity = CGFloat.zero
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .onChange(of: selectedEmoji) { _ in
            isEmojiSelected = true
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct ProfileInRadarView: View {
    @State private var rotationDegree = Angle.zero
    let radarResourceName: String
    let imageResourceName: String
    let radarState: RadarState
    var body: some View {
        ZStack {
            Image(radarResourceName)
                .rotationEffect(rotationDegree)
                .onAppear {
                    withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: false)) {
                        rotationDegree = Angle(degrees: -360.0)
                    }
                }
                .opacity(radarState == .active ? 1.0 : 0.0)
            Image(imageResourceName)
                .offset(y: 3)
        }
    }
}

struct ToastMessageView: View {
    var body: some View {
        HStack {
            Text("🎉 1코인이 적립되었어요!")
                .foregroundColor(.white)
                .padding(.leading, 20)
                .padding(.vertical, 15)
            Spacer()
        }
        .background(.black)
        .padding(.horizontal, 35)
        .shadow(color: .black.opacity(0.22), radius: 12)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

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
    
    // Properties for emoji animation
    @State private var animatingEmojiScale = CGFloat.zero
    @State private var animatingEmojiOpacity = 1.0
    
    // Properties for toast message
    @State private var toastingMessageOpacity = CGFloat.zero
    @State private var toastMessageY = CGFloat(-20)
    
    // Properties for message modal
    @State private var showMessageArchive = false
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
            
            ProfileInRadarView(
                radarResourceName: "myRadar",
                imageResourceName: "sample_profile1",
                fandomImageName: "fandom",
                radarState: .active
            )
            ProfileInRadarView(
                radarResourceName: "anotherRadar",
                imageResourceName: "sample_profile2",
                fandomImageName: "fandom",
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
            .onChange(of: selectedEmoji, perform: { newValue in
                showEmojiSheet = false
            })
            .offset(x: 80, y: -200)
            
            // MARK: - Message Button
            VStack(alignment: .leading) {
                Spacer()
                HStack {
                    Button {
                        showMessageArchive = true
                    } label: {
                        Circle()
                            .frame(width: 54)
                            .foregroundColor(.black)
                            .overlay(
                                Image(systemName: "envelope.fill")
                                    .foregroundColor(.white)
                                    .font(.title3)
                            )
                            .overlay(alignment: .topTrailing) {
                                ZStack {
                                    Circle()
                                        .frame(width: 20)
                                        .foregroundColor(Color(hex: 0xF437CB))
                                    Text("99+")
                                        .foregroundColor(.white)
                                        .font(.system(size: 8, weight: .medium))
                                }
                            }
                    }
                    .padding()
                    .padding(.bottom, 80)

                    Spacer()
                }
            }
            
            // MARK: - Show animation when emoji selected
            if isEmojiSelected {
                if let selectedEmoji = selectedEmoji {
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
                }
                // MARK: - Toast message
                VStack {
                    Spacer()
                    ToastMessageView()
                        .offset(y: toastMessageY)
                }
                .opacity(toastingMessageOpacity)
                .onAppear {
                    // show toast message
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation(.linear(duration: 0.5)) {
                            toastMessageY = CGFloat(-80)
                            toastingMessageOpacity = 1.0
                        }
                    }
                    // dismiss toast message
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation(.linear(duration: 1.0)) {
                            toastMessageY = CGFloat(-20)
                            toastingMessageOpacity = CGFloat.zero
                        }
                    }
                    // toast가 다시 뜨지 않도록
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                        isEmojiSelected = false
                    }
                }
            }
        }
        .sheet(isPresented: $showMessageArchive) {
            MessageArchiveView(senderUsername: "몬스타엑스최고")
                .presentationDetents([.medium, .height(CGFloat(600))])
        }
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

struct ToastMessageView: View {
    var body: some View {
        HStack {
            Text("🎉 5코인이 적립되었어요!")
                .foregroundColor(.white)
                .padding(.leading, 20)
                .padding(.vertical, 15)
            Spacer()
        }
        .background(
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(.black)
        )
        .padding(.horizontal, 35)
        .shadow(color: .black.opacity(0.22), radius: 12)
    }
}

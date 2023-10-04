//
//  SettingFandomView.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

struct SettingFandomView: View {
    @Binding var username: String
    @Binding var profileImageData: Data?
    private let items = [GridItem(), GridItem(), GridItem()]
    private let artists = ["monstax", "straykids", "lesserafim",
                          "idle", "winner", "aespa",
                          "bts", "shinee", "exo"]
    private let artistsKorean = ["monstax": "몬스타엑스", "straykids": "스트레이키즈", "lesserafim": "르세라핌",
                               "idle": "(여자)아이들", "winner": "위너", "aespa": "에스파",
                               "bts": "방탄소년단", "shinee": "샤이니", "exo": "엑소"]
    @State private var selectedArtist: String?
    private var didSelectedArtist: Bool {
        selectedArtist != nil
    }
    var body: some View {
        ZStack {
            Image("bg_green")
                .ignoresSafeArea()
            VStack {
                Text("좋아하는 아티스트를\n한 팀만 뽑아주세요")
                    .font(.title2)
                    .bold()
                    .padding(.bottom, 15)
                
                Text("해당 아티스트의 팬들과 함께 소통할 수 있어요")
                    .font(.callout)
                    .opacity(0.35)
                    .padding(.bottom, 45)
                
                LazyVGrid(columns: items, spacing: 25) {
                    ForEach(artists, id: \.self) { artist in
                        Button {
                            selectedArtist = artist
                        } label: {
                            ArtistButtonView(
                                artist: artist,
                                artistKorean: artistsKorean[artist] ?? "아티스트",
                                selected: selectedArtist == artist
                            )
                        }
                    }
                }
                .padding(.bottom, 25)
                
                Button {
                    if let data = profileImageData {
                        UserViewModel.shared.setUserInformation(username: username)
                    }
                } label: {
                    HStack {
                        Spacer()
                        Text("완료")
                            .foregroundColor(.white)
                            .padding(.vertical, 28)
                        Spacer()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 56)
                            .foregroundColor(didSelectedArtist ? .black : .gray.opacity(0.7))
                    )
                }
                .disabled(!didSelectedArtist)
            }
            .padding(.horizontal, 35)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ArtistButtonView: View {
    let artist: String
    let artistKorean: String
    let selected: Bool
    var body: some View {
        VStack {
            Image(artist)
                .resizable()
                .scaledToFill()
                .frame(width: 95, height: 95)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay {
                    ZStack {
                        if selected {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.black.opacity(0.65))
                            Image(systemName: "checkmark")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                        }
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.black, lineWidth: 1)
                    }
                    
                }
            Text(artistKorean)
                .font(.subheadline)
                .foregroundColor(.black)
        }
    }
}

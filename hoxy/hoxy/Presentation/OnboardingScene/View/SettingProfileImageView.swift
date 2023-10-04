//
//  SettingProfileImageView.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI
import PhotosUI

struct SettingProfileImageView: View {
    @Binding var username: String
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var selectedPhotoData: Data?
    private var isPhotoEmpty: Bool {
        selectedPhoto == nil
    }
    var body: some View {
        ZStack {
            Image("bg_green")
                .ignoresSafeArea()
            VStack(spacing: 60) {
                Text("프로필 사진을 설정해 주세요")
                    .font(.title2)
                    .bold()
                ZStack {
                    PhotosPicker(
                        selection: $selectedPhoto,
                        matching: .images,
                        photoLibrary: .shared()) {
                            if let selectedPhotoData,
                               let uiImage = UIImage(data: selectedPhotoData) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 122, height: 122)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 13)
                                    )
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 13)
                                            .stroke(.black, lineWidth: 1)
                                    }
                            } else {
                                Image("selectImage")
                            }
                        }
                }
            }
            VStack {
                Spacer()
                NavigationLink {
                    SettingFandomView(username: $username, profileImageData: $selectedPhotoData)
                } label: {
                    HStack {
                        Spacer()
                        Text("다음")
                            .foregroundColor(.white)
                            .padding(.vertical, 28)
                        Spacer()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 56)
                            .foregroundColor(isPhotoEmpty ? .gray.opacity(0.7) : .black)
                    )
                }
                .padding(.bottom, 60)
                .padding(.horizontal, 28)
                .disabled(isPhotoEmpty) 
            }
        }
        .navigationBarBackButtonHidden(true)
        .onChange(of: selectedPhoto) { selectPhoto in
            Task {
                if let data = try? await selectPhoto?.loadTransferable(type: Data.self) {
                    selectedPhotoData = data
                }
            }
        }
    }
}

//
//  SettingUsernameView.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

struct SettingUsernameView: View {
    @State private var username = ""
    @State private var invalidCondition = false
    private var isFieldEmpty: Bool {
        username.isEmpty
    }
    var body: some View {
        ZStack {
            Image("bg_green")
                .ignoresSafeArea()
            VStack {
                Text("닉네임을 설정해 주세요")
                    .font(.title2)
                    .bold()
                TextField("띄어쓰기 없이 10자 이내로 입력해 주세요", text: $username)
                    .multilineTextAlignment(.center)
                    .font(.callout)
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 1)
                            )
                    )
                    .padding([.top, .horizontal], 35)
                HStack {
                    Text("조건에 맞추어 닉네임을 다시 입력해 주세요")
                        .font(.caption)
                        .foregroundColor(.red)
                        .padding(.bottom, 60)
                    Spacer()
                }
                .padding(.leading, 40)
                .opacity(invalidCondition ? 1.0 : 0.0)
            }
            VStack {
                Spacer()
                NavigationLink {
                    SettingProfileImageView(username: $username)
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
                            .foregroundColor(isFieldEmpty || invalidCondition ? .gray.opacity(0.7) : .black)
                    )
                }
                .padding(.bottom, 60)
                .padding(.horizontal, 28)
                .disabled(isFieldEmpty || invalidCondition)
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .onChange(of: username) { username in
            invalidCondition = username.contains(" ") || username.count > 10
        }
    }
}

struct SettingUsernameView_Previews: PreviewProvider {
    static var previews: some View {
        SettingUsernameView()
    }
}

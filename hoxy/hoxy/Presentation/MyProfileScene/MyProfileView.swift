//
//  MyProfileView.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

struct MyProfileView: View {
    
    @ObservedObject var viewModel = MyProfileViewModel()
    
    var body: some View {
        ZStack {
            Image("bg_blue")
                .resizable()
                .ignoresSafeArea()
            
            NavigationView {
            // 최상단 유저 정보
                VStack(alignment: .leading, spacing: 15) {
                    Spacer().frame(height: 64)
                    
                    HStack (alignment: .center) {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(viewModel.userProfile.username)
                                    .font(.title)
                                    .fontWeight(.semibold)
                                Text("님,")
                                    .font(.title)
                            }
                            Text("안녕하세요!")
                                .font(.title)
                        }
                        
                        Spacer()
                        
                        AsyncImage(url: URL(string: viewModel.userProfile.profileImagePath)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .modifier(CircleImageModifier())
                                .frame(width: 64, height: 64)
                        } placeholder: {
                            ProgressView()
                                .modifier(CircleImageModifier())
                                .frame(width: 64, height: 64)
                        }

                    } //end
                    
                    Spacer().frame(height: 64)
                    
                    // 팬덤 정보
                    HStack(spacing: 10) {
                        
                        AsyncImage(url: URL(string: viewModel.userProfile.fandomImagePath)) { image in
                            image
                                .resizable()
                                .frame(width: 54, height: 54)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        } placeholder: {
                            ProgressView()
                                .frame(width: 54, height: 54)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                        
                        VStack(alignment: .leading) {
                            Text(viewModel.userProfile.fandomName)
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("아티스트 | \(viewModel.userProfile.artistName)")
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
//                        Image(systemName: "chevron.right.circle")
//                            .resizable()
//                            .frame(width: 20, height: 20)
//                            .foregroundColor(.gray)
                    }
                    .padding()
                    .modifier(RectangleContainerModifier())
        
                    // 코인 정보
                    VStack {
                        HStack {
                            
                            Image("coin")
                                .resizable()
                                .frame(width: 64, height: 64)
                            
                            Text("누적 코인")
                                .font(.title3)
                            
                            Spacer()
                            
                            Text("\(viewModel.userProfile.coins) C")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding()
                        }
                        
                        Divider()
                        
                        VStack (alignment: .center, spacing: 15) {
                            Text("누적 코인은 후즈팬에서 사용 가능해요")
                                .font(.headline)
                                .fontWeight(.semibold)
                            
                            HStack(spacing: 5) {
                                Image("whosapp")
                                    .resizable()
                                    .frame(width: 13, height: 13)
                                
                                Link(destination: URL(string: "https://apps.apple.com/kr/app/id1473903262")!) {
                                    Text("후즈팬 앱으로 이동하기")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .underline(true, color: .gray)
                                }
                            }
                        }
                        .padding()
                    }
                    .padding()
                    .modifier(RectangleContainerModifier())
                    
                    Spacer()
                    
                }
                .padding()
            }
        }
    }
    
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}

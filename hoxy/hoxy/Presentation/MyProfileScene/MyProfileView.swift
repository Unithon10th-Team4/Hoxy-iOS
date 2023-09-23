//
//  MyProfileView.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

struct MyProfileView: View {
    
    let username: String
    let profileImage: UIImage
    
    let fandomImage: UIImage
    let fandomName: String
    let artistName: String
    let coins: Int
    
    var body: some View {
        ZStack {
            Image("bg_blue")
                .resizable()
                .ignoresSafeArea()
            
            // 최상단 유저 정보
            VStack(alignment: .leading, spacing: 15) {
                Spacer().frame(height: 64)
                
                HStack (alignment: .center) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(username)
                                .font(.title)
                                .fontWeight(.semibold)
                            Text("님,")
                                .font(.title)
                        }
                        Text("안녕하세요!")
                            .font(.title)
                    }
                    
                    Spacer()
                    
                    Image(uiImage: profileImage)
                        .resizable()
                        .modifier(CircleImageModifier())
                        .frame(width: 64, height: 64)
                }
                
                Spacer().frame(height: 64)
                
                // 팬덤 정보
                HStack(spacing: 10) {
                    Image(uiImage: fandomImage)
                        .resizable()
                        .frame(width: 54, height: 54)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    VStack(alignment: .leading) {
                        Text(fandomName)
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("아티스트 | \(artistName)")
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.gray)
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
                        
                        Text("\(coins) C")
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

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView(username: "몬스터엑스최고",
                      profileImage: UIImage(named: "myImage")!,
                      fandomImage: UIImage(named: "fandom")!,
                      fandomName: "몬베베",
                      artistName: "몬스터엑스",
                      coins: 1234)
    }
}

//
//  MessageArchiveView.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

struct MessageArchiveView: View {
    let senderUsername: String
    var body: some View {
        VStack {
            List {
                ForEach(0..<15) {_ in
                    HStack {
                        Circle()
                            .foregroundColor(.gray)
                            .frame(width: 54)
                        VStack(alignment: .leading, spacing: 5) {
                            HStack(spacing: 0) {
                                Text("\(senderUsername)")
                                    .font(.callout)
                                    .bold()
                                Text("님이 😘를 보냈어요")
                                    .font(.callout)
                            }
                            Text("2023년 9월 23일")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
        }
    }
}

struct MessageArchiveView_Previews: PreviewProvider {
    static var previews: some View {
        MessageArchiveView(senderUsername: "몬스타엑스최고")
    }
}

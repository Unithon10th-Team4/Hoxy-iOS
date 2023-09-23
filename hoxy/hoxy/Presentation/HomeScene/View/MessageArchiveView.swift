//
//  MessageArchiveView.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

struct MessageArchiveView: View {
    @ObservedObject private var viewModel = MessageArchiveViewModel()
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.messages, id: \.self) { message in
                    HStack {
                        Circle()
                            .foregroundColor(.gray)
                            .frame(width: 54)
                        VStack(alignment: .leading, spacing: 5) {
                            HStack(spacing: 0) {
                                Text("\(message.sender)")
                                    .font(.callout)
                                    .bold()
                                Text("님이 \(message.contents)를 보냈어요")
                                    .font(.callout)
                            }
                            Text("\(message.timestamp)")
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
        MessageArchiveView()
    }
}

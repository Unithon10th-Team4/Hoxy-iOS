//
//  EmojiSheetView.swift
//  hoxy
//
//  Created by 제나 on 2023/09/23.
//

import SwiftUI

enum Emoji: String {
    case emoji_smile
    case emoji_kiss
    case emoji_heart
    case emoji_sunglasses
}

struct EmojiSheetView: View {
    let emojis = [Emoji.emoji_smile, .emoji_kiss, .emoji_heart, .emoji_sunglasses]
    @Binding var selectedEmoji: Emoji?
    
    var body: some View {
        HStack(spacing: 10) {
            if let _ = selectedEmoji {
                Text("이미 반응을 보냈어요!")
                    .foregroundColor(.white)
            } else {
                ForEach(emojis, id: \.self) { emoji in
                    Image(emoji.rawValue)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .onTapGesture {
                            selectedEmoji = emoji
                        }
                }
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .frame(width: 190)
        .background(
            RoundedRectangle(cornerRadius: 10)
        )
    }
}

struct EmojiSheetView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiSheetView(selectedEmoji: .constant(Emoji.emoji_sunglasses))
    }
}

//
//  EmojiArtistDocument.swift
//  EmojiArtist
//
//  Created by Roy Park on 9/3/21.
//

import SwiftUI

class EmojiArtistDocument: ObservableObject {
    @Published private(set) var emojiArtist: EmojiArtistModel
    
    init() {
        emojiArtist = EmojiArtistModel()
        emojiArtist.addEmoji("🦉", at: (-200, -200), size: 80)
        emojiArtist.addEmoji("🦊", at: (50, 100), size: 100)
    }
    
    // Convenience functions to get them
    var emojis: [EmojiArtistModel.Emoji] { emojiArtist.emojis }
    var background: EmojiArtistModel.Background { emojiArtist.background }
    
    // MARK: - Intent(s)
    
    func setBackground(_ background: EmojiArtistModel.Background) {
        emojiArtist.background = background
    }
    
    func moveEmoji(_ emoji: EmojiArtistModel.Emoji, by offset: CGSize) {
        if let index = emojiArtist.emojis.index(matching: emoji) {
            emojiArtist.emojis[index].x += Int(offset.width)
            emojiArtist.emojis[index].y += Int(offset.height)
        }
    }
    
    func scaleEmoji(_ emoji: EmojiArtistModel.Emoji, by scale: CGFloat) {
        if let index = emojiArtist.emojis.index(matching: emoji) {
            emojiArtist.emojis[index].size = Int((CGFloat(emojiArtist.emojis[index].size) *
                                                    scale).rounded(.toNearestOrAwayFromZero))
        }
    }
}


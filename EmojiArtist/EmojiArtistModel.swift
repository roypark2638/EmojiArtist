//
//  EmojiArtistModel.swift
//  EmojiArtist
//
//  Created by Roy Park on 9/2/21.
//

import Foundation

struct EmojiArtistModel {
    var background = Background.blank
    var emojis = [Emoji]()
    
    // Hashable, you might want to put them in a Set for example.
    struct Emoji: Identifiable, Hashable {
        let text: String
        // There are not CGFloat, This is a device and UI independent representation
        // Using Int to emphasize it's not CGFloat. it can be Double or Float.
        var x: Int // offset from the center
        var y: Int // offset from the center
        var size: Int
        let id: Int
        
        // This prevents someone from accessing these emojis to add with random id
        // Nobody will be able to create an Emoji except us within this file.
        fileprivate init(text: String, x: Int, y: Int, size: Int, id: Int) {
            self.text = text
            self.x = x
            self.y = y
            self.size = size
            self.id = id
        }
    }
    
    init() { }
    
    private var uniqueEmojiId = 0
    
    mutating func addEmoji(_ text: String, at location: (x: Int, y: Int), size: Int) {
        uniqueEmojiId += 1
        emojis.append(Emoji(text: text, x: location.x, y: location.y, size: size, id: uniqueEmojiId))
    }

}

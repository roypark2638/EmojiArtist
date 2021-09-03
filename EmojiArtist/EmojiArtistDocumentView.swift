//
//  EmojiArtistDocumentView.swift
//  EmojiArtist
//
//  Created by Roy Park on 9/2/21.
//

import SwiftUI

struct EmojiArtistDocumentView: View {
    @ObservedObject var document: EmojiArtistDocument
    
    let defaultEmojiFontSize: CGFloat = 40
    
    var body: some View {
        VStack(spacing: 0) {
            documentBody
            palette
        }
    }
    
    var documentBody: some View {
        GeometryReader { geometry in
            ZStack {
                Color.yellow // same as rectangle(foregroundColor(.yellow)
                ForEach(document.emojis) { emoji in
                    Text(emoji.text)
                        .font(.system(size: fontSize(for: emoji)))
                        .position(position(for: emoji, in: geometry))
                }
            }
        }
    }
    
    private func position(for emoji: EmojiArtistModel.Emoji, in geometry: GeometryProxy) -> CGPoint {
        convertFromEmojiCoordinates((emoji.x, emoji.y), in: geometry)
    }
    
    private func convertFromEmojiCoordinates(_ location: (x: Int, y: Int), in geometry: GeometryProxy) -> CGPoint {
        let center = geometry.frame(in: .local).center
        
        return CGPoint(
            x: center.x + CGFloat(location.x),
            y: center.y + CGFloat(location.y)
        )
    }
    
    private func fontSize(for emoji: EmojiArtistModel.Emoji) -> CGFloat {
        CGFloat(emoji.size)
    }
    
    var palette: some View {
        ScrollingEmojisView(emojis: testEmojis)
            .font(.system(size: defaultEmojiFontSize))
    }
    
    var testEmojis = "🐼🐻🦊🐰👠🐼🐻🦊🐰👠🐼🐻🦊🐰👠🐼🐻🦊🐰👠🐼🐻🦊🐰👠🐼🐻🦊🐰👠🐼🐻🦊🐰👠🐼🐻🦊🐰👠🐼🐻🦊🐰👠"
}

struct ScrollingEmojisView: View {
    let emojis: String
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(emojis.map { String($0) }, id: \.self) { emoji in
                    Text(emoji)
                }
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtistDocumentView(document: EmojiArtistDocument())
    }
}

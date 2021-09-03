//
//  EmojiArtistApp.swift
//  EmojiArtist
//
//  Created by Roy Park on 9/2/21.
//

import SwiftUI

@main
struct EmojiArtistApp: App {
    let document = EmojiArtistDocument()
    
    var body: some Scene {
        WindowGroup {
            EmojiArtistDocumentView(document: document)
        }
    }
}

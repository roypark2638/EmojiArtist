//
//  EmojiArtistModel.Background.swift
//  EmojiArtist
//
//  Created by Roy Park on 9/2/21.
//

import Foundation

extension EmojiArtistModel {
    enum Background {
        case blank            // Empty
        case url(URL)         // image from internet
        case imageData(Data)  // actual image data for a JPEG or TIFF
        
        var url: URL? {
            switch self {
            case .url(let url): return url
            default: return nil
            }
        }
        
        var imageData: Data? {
            switch self {
            case .imageData(let data): return data
            default: return nil
            }
        }
    }
}

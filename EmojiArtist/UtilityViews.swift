//
//  UtilityViews.swift
//  EmojiArtist
//
//  Created by Roy Park on 9/3/21.
//

import SwiftUI

// syntactic sugar to be able to pass an optional UIImage to Image
// (normally it would only take a non-optional UIImage

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View {
        if uiImage != nil {
            Image(uiImage: uiImage!)
        }
    }
}

// syntactic sugar
// lots of times we want to a simple button
// with just text or a label or a systemImage
// but we want the action it performs to be animated
// (i.e. withAnimation)
// this just makes it easy to create such a button
// and thus cleans up our code

//struct AnimatedActionButton: View {
//    var title: String? = nil
//    var systemImage: String? = nil
//    let action: () -> Void
//
//    var body: some View {
//        Button {
//            withAnimation {
//                action()
//            }
//        } label: {
//            if title != nil && systemImage != nil {
//                Label(title!, systemImage: systemImage!)
//            } else if title != nil {
//                Text(title!)
//            } else if systemImage != nil {
//                Image(systemImage: systemImage!)
//            }
//        }
//    }
//}

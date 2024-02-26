import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct CardMediaBaseStyle: CardMediaStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CardMediaConfiguration) -> some View {
        // Add default layout here
        configuration.mediaImage
            .overlay(alignment: .bottomLeading) {
                configuration.description
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
            }
    }
}

// Default fiori styles
extension CardMediaFioriStyle {
    struct ContentFioriStyle: CardMediaStyle {
        func makeBody(_ configuration: CardMediaConfiguration) -> some View {
            CardMedia(configuration)
            // Add default style for its content
            // .background()
        }
    }
    
    struct MediaImageFioriStyle: MediaImageStyle {
        func makeBody(_ configuration: MediaImageConfiguration) -> some View {
            MediaImage(configuration)
                .frame(maxWidth: .infinity)
                .clipped()
        }
    }
    
    struct DescriptionFioriStyle: DescriptionStyle {
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
                // Add default style for Description
                .font(.fiori(forTextStyle: .title1, weight: .bold))
                .foregroundColor(.preferredColor(.primaryLabel))
        }
    }
}

#Preview("Data Base") {
    CardMedia(mediaImage: Image(systemName: "sportscourt"), description: "Title")
}

#Preview("VB Base") {
    CardMedia {
        Image(systemName: "sportscourt")
            .resizable()
            .aspectRatio(contentMode: .fill)
    } description: {
        Text("Title")
            .foregroundColor(.purple)
    }
    .frame(height: 415)
}

#Preview("VB Fiori") {
    CardMedia {
        Color.purple
            .frame(width: 300, height: 145)
    } description: {
        Text("Title")
    }
    .frame(height: 600)
}

#Preview("M") {
    Text("hello")
        .foregroundColor(Color.blue)
        .foregroundColor(Color.red)
        .font(.largeTitle)
        .font(.footnote)
        .frame(height: 172)
        .frame(width: 200)
        .frame(height: 70)
        .border(Color.black)
}

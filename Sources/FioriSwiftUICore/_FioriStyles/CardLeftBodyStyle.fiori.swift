import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
public struct CardLeftBodyBaseStyle: CardLeftBodyStyle {
    public func makeBody(_ configuration: CardLeftBodyConfiguration) -> some View {
        // Add default layout here
        configuration
            .mediaLeftImage
            .aspectRatio(1, contentMode: .fill)
            .clipped()
    }
}

// Default fiori styles
extension CardLeftBodyFioriStyle {
    struct ContentFioriStyle: CardLeftBodyStyle {
        func makeBody(_ configuration: CardLeftBodyConfiguration) -> some View {
            CardLeftBody(configuration)
            // Add default style for its content
            // .background()
        }
    }
}

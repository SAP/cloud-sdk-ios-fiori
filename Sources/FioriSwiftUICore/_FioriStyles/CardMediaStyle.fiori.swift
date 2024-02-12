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
        configuration.description
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
            // Add default style for MediaImage
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }

    struct DescriptionFioriStyle: DescriptionStyle {
        func makeBody(_ configuration: DescriptionConfiguration) -> some View {
            Description(configuration)
            // Add default style for Description
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}

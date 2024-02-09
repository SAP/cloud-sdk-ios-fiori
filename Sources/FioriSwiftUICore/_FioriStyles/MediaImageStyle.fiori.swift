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
public struct MediaImageBaseStyle: MediaImageStyle {
    public func makeBody(_ configuration: MediaImageConfiguration) -> some View {
        // Add default layout here
        configuration.mediaImage
    }
}

// Default fiori styles
public struct MediaImageFioriStyle: MediaImageStyle {
    public func makeBody(_ configuration: MediaImageConfiguration) -> some View {
        MediaImage(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}

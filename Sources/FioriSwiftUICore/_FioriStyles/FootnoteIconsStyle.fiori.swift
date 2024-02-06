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
public struct FootnoteIconsBaseStyle: FootnoteIconsStyle {
    public func makeBody(_ configuration: FootnoteIconsConfiguration) -> some View {
        configuration.footnoteIcons
    }
}

// Default fiori styles
public struct FootnoteIconsFioriStyle: FootnoteIconsStyle {
    public func makeBody(_ configuration: FootnoteIconsConfiguration) -> some View {
        FootnoteIcons(configuration)
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct FootnoteBaseStyle: FootnoteStyle {
    public func makeBody(_ configuration: FootnoteConfiguration) -> some View {
        configuration.footnote
    }
}

// Default fiori styles
public struct FootnoteFioriStyle: FootnoteStyle {
    public func makeBody(_ configuration: FootnoteConfiguration) -> some View {
        Footnote(configuration)
            .foregroundStyle(Color.preferredColor(.tertiaryLabel))
            .font(.fiori(forTextStyle: .subheadline))
    }
}

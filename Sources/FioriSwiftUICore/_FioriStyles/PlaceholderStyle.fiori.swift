import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment the following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct PlaceholderBaseStyle: PlaceholderStyle {
    @ViewBuilder
    public func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
        configuration.placeholder
    }
}

// Default fiori styles
public struct PlaceholderFioriStyle: PlaceholderStyle {
    @ViewBuilder
    public func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
        Placeholder(configuration)
            .foregroundStyle(Color.preferredColor(.tertiaryLabel))
            .font(.fiori(forTextStyle: .body).italic())
    }
}

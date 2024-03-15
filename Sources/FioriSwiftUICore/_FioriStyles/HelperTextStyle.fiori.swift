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
public struct HelperTextBaseStyle: HelperTextStyle {
    @ViewBuilder
    public func makeBody(_ configuration: HelperTextConfiguration) -> some View {
        // Add default layout here
        configuration.helperText
    }
}

// Default fiori styles
public struct HelperTextFioriStyle: HelperTextStyle {
    @ViewBuilder
    public func makeBody(_ configuration: HelperTextConfiguration) -> some View {
        HelperText(configuration)
            .foregroundStyle(Color.preferredColor(.tertiaryLabel).opacity(0.9))
            .font(.fiori(forTextStyle: .caption1))
            .lineLimit(2)
    }
}

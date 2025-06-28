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
public struct DescriptionBaseStyle: DescriptionStyle {
    public func makeBody(_ configuration: DescriptionConfiguration) -> some View {
        configuration.description
    }
}

// Default fiori styles
public struct DescriptionFioriStyle: DescriptionStyle {
    @Environment(\.isLoading) var isLoading
    public func makeBody(_ configuration: DescriptionConfiguration) -> some View {
        Description(configuration)
            .foregroundStyle(Color.preferredColor(self.isLoading ? .separator : .tertiaryLabel))
            .font(.fiori(forTextStyle: .subheadline))
    }
}

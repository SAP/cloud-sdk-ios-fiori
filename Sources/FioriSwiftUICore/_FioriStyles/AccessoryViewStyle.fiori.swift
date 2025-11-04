import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
public struct AccessoryViewBaseStyle: AccessoryViewStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AccessoryViewConfiguration) -> some View {
        configuration.accessoryType.image
    }
}

// Default fiori styles
public struct AccessoryViewFioriStyle: AccessoryViewStyle {
    @Environment(\.layoutDirection) var layoutDirection
    
    @ViewBuilder
    public func makeBody(_ configuration: AccessoryViewConfiguration) -> some View {
        AccessoryView(configuration)
            .rotationEffect(.degrees((self.layoutDirection == .rightToLeft && configuration.accessoryType == .disclosure) ? 180 : 0))
            .foregroundStyle(Color.preferredColor(configuration.accessoryType == .disclosure ? .separator : .tintColor))
            .accessibilityRemoveTraits(.isSelected)
            .accessibilityRemoveTraits(.isButton)
            .accessibilityAddTraits(configuration.accessoryType == .checkmark ? .isSelected : .isButton)
    }
}

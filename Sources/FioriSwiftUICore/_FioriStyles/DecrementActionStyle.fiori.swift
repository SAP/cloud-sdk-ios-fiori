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
public struct DecrementActionBaseStyle: DecrementActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DecrementActionConfiguration) -> some View {
        // Add default layout here
        configuration.decrementAction
    }
}

// Default fiori styles
public struct DecrementActionFioriStyle: DecrementActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DecrementActionConfiguration) -> some View {
        DecrementAction(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}

public struct DecrementActionActivateStyle: DecrementActionStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    public func makeBody(_ configuration: DecrementActionConfiguration) -> some View {
        DecrementAction(configuration)
            .disabled(!self.isEnabled)
            .foregroundColor(.preferredColor(self.isEnabled ? .tertiaryLabel : .separator))
            .allowsHitTesting(self.isEnabled)
    }
}

public struct DecrementActionDeactivateStyle: DecrementActionStyle {
    public func makeBody(_ configuration: DecrementActionConfiguration) -> some View {
        DecrementAction(configuration)
            .disabled(true)
            .foregroundColor(.preferredColor(.separator))
            .allowsHitTesting(false)
    }
}

public extension DecrementActionStyle where Self == DecrementActionActivateStyle {
    /// The `activate` style is applied in the case that the decrement button is disabled.
    static var activate: DecrementActionActivateStyle {
        DecrementActionActivateStyle()
    }
}

public extension DecrementActionStyle where Self == DecrementActionDeactivateStyle {
    /// The `deactivate` style is applied in the case that the decrement button is disabled.
    static var deactivate: DecrementActionDeactivateStyle {
        DecrementActionDeactivateStyle()
    }
}

// Default nss styles
public struct DecrementActionNSSStyle: DecrementActionStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: DecrementActionConfiguration) -> some View {
        DecrementAction(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.decrementActionIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

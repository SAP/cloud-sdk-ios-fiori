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
public struct IncrementActionBaseStyle: IncrementActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: IncrementActionConfiguration) -> some View {
        // Add default layout here
        configuration.incrementAction
    }
}

// Default fiori styles
public struct IncrementActionFioriStyle: IncrementActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: IncrementActionConfiguration) -> some View {
        IncrementAction(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}

// Default nss styles
public struct IncrementActionNSSStyle: IncrementActionStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: IncrementActionConfiguration) -> some View {
        IncrementAction(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.incrementActionIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

public struct IncrementActionActivateStyle: IncrementActionStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    public func makeBody(_ configuration: IncrementActionConfiguration) -> some View {
        IncrementAction(configuration)
            .disabled(!self.isEnabled)
            .foregroundColor(.preferredColor(self.isEnabled ? .tertiaryLabel : .separator))
            .allowsHitTesting(self.isEnabled)
    }
}

public struct IncrementActionDeactivateStyle: IncrementActionStyle {
    @Environment(\.isEnabled) var isEnabled: Bool
    public func makeBody(_ configuration: IncrementActionConfiguration) -> some View {
        IncrementAction(configuration)
            .disabled(true)
            .foregroundColor(.preferredColor(.separator))
            .allowsHitTesting(false)
    }
}

public extension IncrementActionStyle where Self == IncrementActionActivateStyle {
    /// The `activate` style is applied in the case that the increment button is disabled.
    static var activate: IncrementActionActivateStyle {
        IncrementActionActivateStyle()
    }
}

public extension IncrementActionStyle where Self == IncrementActionDeactivateStyle {
    /// The `deactivate` style is applied in the case that the increment button is disabled.
    static var deactivate: IncrementActionDeactivateStyle {
        IncrementActionDeactivateStyle()
    }
}

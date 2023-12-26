import FioriMacro
import FioriThemeManager
import Foundation
import SwiftUI

@ComponentStyle
public protocol ActionTitleStyle: DynamicProperty {}

// MARK: Macro generated

extension ActionTitleStyle where Self == ActionTitleBaseStyle {
    static var base: ActionTitleBaseStyle {
        ActionTitleBaseStyle()
    }
}

extension ActionTitleStyle where Self == ActionTitleFioriStyle {
    static var fiori: ActionTitleFioriStyle {
        ActionTitleFioriStyle()
    }
}

// Modifier

public struct ActionTitleStyleModifier<Style: ActionTitleStyle>: ViewModifier {
    let style: Style
    
    public func body(content: Content) -> some View {
        content
            .actionTitleStyle(self.style)
    }
}

extension ActionTitleStyle {
    // Modify the current style.
    func modifier(_ modifier: some ViewModifier) -> some ActionTitleStyle {
        ModifiedStyle(style: self, modifier: modifier)
    }
    
    // Concatenate a new style on current style. The current style is the base style so it will take the precedence.
    func concat(_ style: some ActionTitleStyle) -> some ActionTitleStyle {
        style.modifier(ActionTitleStyleModifier(style: self))
    }
}

// MARK: SDK Developer implementations

// Base Layout style
public struct ActionTitleBaseStyle: ActionTitleStyle {
    public func makeBody(_ configuration: ActionTitleConfiguration) -> some View {
        configuration.actionTitle
    }
}

// Default fiori styles
public struct ActionTitleFioriStyle: ActionTitleStyle {
    public func makeBody(_ configuration: ActionTitleConfiguration) -> some View {
        ActionTitle(configuration)
            .foregroundStyle(Color.preferredColor(.tintColor))
            .font(.title)
    }
}

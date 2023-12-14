import FioriThemeManager
import Foundation
import SwiftUI

// MARK: Macro generated

// public protocol ActionTitleStyle: DynamicProperty {
//    associatedtype Body: View
//    func makeBody(_ configuration: ActionTitleConfiguration) -> Body
// }

public struct ActionTitleConfiguration {
    let actionTitle: ActionTitle
    
    public typealias ActionTitle = ConfigurationViewWrapper
}

public struct AnyActionTitleStyle: ActionTitleStyle {
    let content: (ActionTitleConfiguration) -> any View
    
    init(@ViewBuilder _ content: @escaping (ActionTitleConfiguration) -> any View) {
        self.content = content
    }
    
    public func makeBody(_ configuration: ActionTitleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

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

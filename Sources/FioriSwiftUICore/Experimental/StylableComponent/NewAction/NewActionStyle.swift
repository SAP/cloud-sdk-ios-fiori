import FioriThemeManager
// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol NewActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: NewActionConfiguration) -> Body
}

struct AnyNewActionStyle: NewActionStyle {
    let content: (NewActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (NewActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: NewActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct NewActionConfiguration {
    public let actionTitle: ActionTitle
    public let action: (() -> Void)?

    public typealias ActionTitle = ConfigurationViewWrapper
}

public struct NewActionFioriStyle: NewActionStyle {
    public func makeBody(_ configuration: NewActionConfiguration) -> some View {
        NewAction(configuration)
            .actionTitleStyle(ActionTitleFioriStyle())
    }
}

// MARK: SDK Developer implementations

// Base Layout style
public struct NewActionBaseStyle: NewActionStyle {
    public func makeBody(_ configuration: NewActionConfiguration) -> some View {
        // Add default layout here
        Button(action: configuration.action ?? {}) {
            configuration.actionTitle
        }
    }
}

// Default fiori styles
private extension NewActionFioriStyle {
    struct ActionTitleFioriStyle: ActionTitleStyle {
        func makeBody(_ configuration: ActionTitleConfiguration) -> some View {
            ActionTitle(configuration)
                // Add default style here
                .foregroundStyle(Color.preferredColor(.tintColor))
                .font(.fiori(forTextStyle: .title1))
        }
    }
}

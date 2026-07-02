// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol ActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: ActionConfiguration) -> Body
}

struct AnyActionStyle: ActionStyle {
    let content: (ActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ActionConfiguration {
    public var componentIdentifier: String = "fiori_action_component"
    public let action: Action

    public typealias Action = ConfigurationViewWrapper
}

extension ActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct ActionDefaultStyle: ActionStyle {
    nonisolated init() {}

    func makeBody(_ configuration: ActionConfiguration) -> some View {
        Action(configuration)
            .actionStyle(ActionBaseStyle())
    }
}

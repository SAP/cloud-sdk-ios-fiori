// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Action {
    let action: any View

    @Environment(\.actionStyle) var style

    var componentIdentifier: String = Action.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder action: () -> any View = { EmptyView() },
                componentIdentifier: String? = Action.identifier)
    {
        self.action = action()
        self.componentIdentifier = componentIdentifier ?? Action.identifier
    }
}

public extension Action {
    static let identifier = "fiori_action_component"
}

public extension Action {
    init(action: FioriButton? = nil,
         componentIdentifier: String? = Action.identifier)
    {
        self.init(action: { action }, componentIdentifier: componentIdentifier)
    }
}

public extension Action {
    init(_ configuration: ActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.action = configuration.action
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Action: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, action: .init(self.action))).typeErased
                .transformEnvironment(\.actionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Action {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Action(.init(componentIdentifier: self.componentIdentifier, action: .init(self.action)))
            .shouldApplyDefaultStyle(false)
            .actionStyle(.fiori)
            .typeErased
    }
}

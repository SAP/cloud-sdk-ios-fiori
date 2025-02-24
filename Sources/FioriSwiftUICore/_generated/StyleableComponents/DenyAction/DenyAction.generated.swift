// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct DenyAction {
    let denyAction: any View

    @Environment(\.denyActionStyle) var style

    var componentIdentifier: String = DenyAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder denyAction: () -> any View = { FioriButton { _ in Text("Deny".localizedFioriString()) } },
                componentIdentifier: String? = DenyAction.identifier)
    {
        self.denyAction = denyAction()
        self.componentIdentifier = componentIdentifier ?? DenyAction.identifier
    }
}

public extension DenyAction {
    static let identifier = "fiori_denyaction_component"
}

public extension DenyAction {
    init(denyAction: FioriButton? = FioriButton { _ in Text("Deny".localizedFioriString()) }) {
        self.init(denyAction: { denyAction })
    }
}

public extension DenyAction {
    init(_ configuration: DenyActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DenyActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.denyAction = configuration.denyAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension DenyAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, denyAction: .init(self.denyAction))).typeErased
                .transformEnvironment(\.denyActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DenyAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DenyAction(.init(componentIdentifier: self.componentIdentifier, denyAction: .init(self.denyAction)))
            .shouldApplyDefaultStyle(false)
            .denyActionStyle(.fiori)
            .typeErased
    }
}

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct DecrementAction {
    let decrementAction: any View

    @Environment(\.decrementActionStyle) var style

    var componentIdentifier: String = DecrementAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder decrementAction: () -> any View = { FioriButton { _ in FioriIcon.actions.less } },
                componentIdentifier: String? = DecrementAction.identifier)
    {
        self.decrementAction = decrementAction()
        self.componentIdentifier = componentIdentifier ?? DecrementAction.identifier
    }
}

public extension DecrementAction {
    static let identifier = "fiori_decrementaction_component"
}

public extension DecrementAction {
    init(decrementAction: FioriButton? = FioriButton { _ in FioriIcon.actions.less }) {
        self.init(decrementAction: { decrementAction })
    }
}

public extension DecrementAction {
    init(_ configuration: DecrementActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DecrementActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.decrementAction = configuration.decrementAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension DecrementAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, decrementAction: .init(self.decrementAction))).typeErased
                .transformEnvironment(\.decrementActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DecrementAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DecrementAction(.init(componentIdentifier: self.componentIdentifier, decrementAction: .init(self.decrementAction)))
            .shouldApplyDefaultStyle(false)
            .decrementActionStyle(.fiori)
            .typeErased
    }
}

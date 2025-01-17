// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct IncrementAction {
    let incrementAction: any View

    @Environment(\.incrementActionStyle) var style

    var componentIdentifier: String = IncrementAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder incrementAction: () -> any View = { FioriButton { _ in FioriIcon.actions.add } },
                componentIdentifier: String? = IncrementAction.identifier)
    {
        self.incrementAction = incrementAction()
        self.componentIdentifier = componentIdentifier ?? IncrementAction.identifier
    }
}

public extension IncrementAction {
    static let identifier = "fiori_incrementaction_component"
}

public extension IncrementAction {
    init(incrementAction: FioriButton? = FioriButton { _ in FioriIcon.actions.add },
         componentIdentifier: String? = IncrementAction.identifier)
    {
        self.init(incrementAction: { incrementAction }, componentIdentifier: componentIdentifier)
    }
}

public extension IncrementAction {
    init(_ configuration: IncrementActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: IncrementActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.incrementAction = configuration.incrementAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension IncrementAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, incrementAction: .init(self.incrementAction))).typeErased
                .transformEnvironment(\.incrementActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension IncrementAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        IncrementAction(.init(componentIdentifier: self.componentIdentifier, incrementAction: .init(self.incrementAction)))
            .shouldApplyDefaultStyle(false)
            .incrementActionStyle(.fiori)
            .typeErased
    }
}

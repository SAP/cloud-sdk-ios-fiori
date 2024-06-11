// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct DecrementAction {
    let decrementAction: any View

    @Environment(\.decrementActionStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder decrementAction: () -> any View = { FioriButton { _ in Image(systemName: "minus") } }) {
        self.decrementAction = decrementAction()
    }
}

public extension DecrementAction {
    init(decrementAction: FioriButton? = FioriButton { _ in Image(systemName: "minus") }) {
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
    }
}

extension DecrementAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(decrementAction: .init(self.decrementAction))).typeErased
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
        DecrementAction(decrementAction: { self.decrementAction })
            .shouldApplyDefaultStyle(false)
            .decrementActionStyle(.fiori)
            .typeErased
    }
}

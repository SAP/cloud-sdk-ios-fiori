// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct OverflowAction {
    let overflowAction: any View

    @Environment(\.overflowActionStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder overflowAction: () -> any View = { FioriButton { _ in Image(systemName: "ellipsis") } }) {
        self.overflowAction = overflowAction()
    }
}

public extension OverflowAction {
    init(overflowAction: FioriButton? = FioriButton { _ in Image(systemName: "ellipsis") }) {
        self.init(overflowAction: { overflowAction })
    }
}

public extension OverflowAction {
    init(_ configuration: OverflowActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: OverflowActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.overflowAction = configuration.overflowAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension OverflowAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(overflowAction: .init(self.overflowAction))).typeErased
                .transformEnvironment(\.overflowActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension OverflowAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        OverflowAction(.init(overflowAction: .init(self.overflowAction)))
            .shouldApplyDefaultStyle(false)
            .overflowActionStyle(.fiori)
            .typeErased
    }
}

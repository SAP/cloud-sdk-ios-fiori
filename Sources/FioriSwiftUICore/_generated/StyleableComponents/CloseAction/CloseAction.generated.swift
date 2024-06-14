// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct CloseAction {
    let closeAction: any View

    @Environment(\.closeActionStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder closeAction: () -> any View = { FioriButton { _ in Image(systemName: "xmark") } }) {
        self.closeAction = closeAction()
    }
}

public extension CloseAction {
    init(closeAction: FioriButton? = FioriButton { _ in Image(systemName: "xmark") }) {
        self.init(closeAction: { closeAction })
    }
}

public extension CloseAction {
    init(_ configuration: CloseActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CloseActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.closeAction = configuration.closeAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension CloseAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(closeAction: .init(self.closeAction))).typeErased
                .transformEnvironment(\.closeActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CloseAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        CloseAction(closeAction: { self.closeAction })
            .shouldApplyDefaultStyle(false)
            .closeActionStyle(.fiori)
            .typeErased
    }
}

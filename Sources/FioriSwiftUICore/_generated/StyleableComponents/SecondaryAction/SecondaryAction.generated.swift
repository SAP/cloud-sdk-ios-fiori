// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SecondaryAction {
    let secondaryAction: any View

    @Environment(\.secondaryActionStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder secondaryAction: () -> any View = { EmptyView() }) {
        self.secondaryAction = secondaryAction()
    }
}

public extension SecondaryAction {
    init(secondaryAction: FioriButton? = nil) {
        self.init(secondaryAction: { secondaryAction })
    }
}

public extension SecondaryAction {
    init(_ configuration: SecondaryActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SecondaryActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.secondaryAction = configuration.secondaryAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension SecondaryAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(secondaryAction: .init(self.secondaryAction))).typeErased
                .transformEnvironment(\.secondaryActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SecondaryAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        SecondaryAction(secondaryAction: { self.secondaryAction })
            .shouldApplyDefaultStyle(false)
            .secondaryActionStyle(.fiori)
            .typeErased
    }
}

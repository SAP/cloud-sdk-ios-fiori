// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TertiaryAction {
    let tertiaryAction: any View

    @Environment(\.tertiaryActionStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder tertiaryAction: () -> any View = { EmptyView() }) {
        self.tertiaryAction = tertiaryAction()
    }
}

public extension TertiaryAction {
    init(tertiaryAction: FioriButton? = nil) {
        self.init(tertiaryAction: { tertiaryAction })
    }
}

public extension TertiaryAction {
    init(_ configuration: TertiaryActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TertiaryActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.tertiaryAction = configuration.tertiaryAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TertiaryAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(tertiaryAction: .init(self.tertiaryAction))).typeErased
                .transformEnvironment(\.tertiaryActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TertiaryAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TertiaryAction(.init(tertiaryAction: .init(self.tertiaryAction)))
            .shouldApplyDefaultStyle(false)
            .tertiaryActionStyle(.fiori)
            .typeErased
    }
}

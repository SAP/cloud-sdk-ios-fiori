// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SeeAllAction {
    let seeAllAction: any View

    @Environment(\.seeAllActionStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder seeAllAction: () -> any View = { Image(systemName: "chevron.forward") }) {
        self.seeAllAction = seeAllAction()
    }
}

public extension SeeAllAction {
    init(_ configuration: SeeAllActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SeeAllActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.seeAllAction = configuration.seeAllAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension SeeAllAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(seeAllAction: .init(self.seeAllAction))).typeErased
                .transformEnvironment(\.seeAllActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SeeAllAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SeeAllAction(seeAllAction: { self.seeAllAction })
            .shouldApplyDefaultStyle(false)
            .seeAllActionStyle(.fiori)
            .typeErased
    }
}

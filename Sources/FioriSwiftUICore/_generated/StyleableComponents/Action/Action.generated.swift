// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Action {
    let action: any View

    @Environment(\.actionStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder action: () -> any View = { EmptyView() }) {
        self.action = action()
    }
}

public extension Action {
    init(action: FioriButton? = nil) {
        self.init(action: { action })
    }
}

public extension Action {
    init(_ configuration: ActionConfiguration) {
        self.action = configuration.action
        self._shouldApplyDefaultStyle = false
    }
}

extension Action: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(action: .init(self.action))).typeErased
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
        Action(action: { self.action })
            .shouldApplyDefaultStyle(false)
            .actionStyle(.fiori)
            .typeErased
    }
}

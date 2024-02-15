// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct NewAction {
    let newAction: any View

    @Environment(\.newActionStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder newAction: () -> any View = { EmptyView() }) {
        self.newAction = newAction()
    }
}

public extension NewAction {
    init(newAction: FioriButton? = nil) {
        self.init(newAction: { newAction })
    }
}

public extension NewAction {
    init(_ configuration: NewActionConfiguration) {
        self.newAction = configuration.newAction
        self._shouldApplyDefaultStyle = false
    }
}

extension NewAction: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(newAction: .init(self.newAction))).typeErased
                .transformEnvironment(\.newActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension NewAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        NewAction(newAction: { self.newAction })
            .shouldApplyDefaultStyle(false)
            .newActionStyle(.fiori)
            .typeErased
    }
}

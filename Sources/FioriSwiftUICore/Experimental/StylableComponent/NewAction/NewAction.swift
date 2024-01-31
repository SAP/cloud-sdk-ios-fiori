// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct NewAction {
    let actionTitle: any View
    let action: (() -> Void)?

    @Environment(\.newActionStyle) var style

    public init(@ViewBuilder actionTitle: () -> any View = { EmptyView() },
                action: (() -> Void)? = nil)
    {
        self.actionTitle = ActionTitle { actionTitle() }
        self.action = action
    }
}

public extension NewAction {
    init(actionTitle: AttributedString? = nil,
         action: (() -> Void)? = nil)
    {
        self.init(actionTitle: { OptionalText(actionTitle) }, action: action)
    }
}

public extension NewAction {
    init(_ configuration: NewActionConfiguration) {
        self.actionTitle = configuration.actionTitle
        self.action = configuration.action
    }
}

extension NewAction: View {
    public var body: some View {
        style.resolve(configuration: .init(actionTitle: .init(self.actionTitle), action: self.action)).typeErased
            .transformEnvironment(\.newActionStyleStack) { stack in
                if !stack.isEmpty {
                    stack.removeLast()
                }
            }
    }
}

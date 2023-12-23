import Foundation
import SwiftUI

public struct NewAction: _ActionComponent {
    @ViewBuilder
    let actionTitle: any View
    let action: (() -> Void)?
    
    @Environment(\.newActionStyle) var style
    
    init(actionTitle: () -> some View = { EmptyView() }, action: (() -> Void)? = nil) {
        self.actionTitle = ActionTitle { actionTitle() }
        self.action = action
    }
}

public extension NewAction {
    init(
        actionTitle: AttributedString,
        action: (() -> Void)? = nil
    ) {
        self.init(actionTitle: { Text(actionTitle) }, action: action)
    }
}

public extension NewAction {
    init(
        _ configuration: NewActionConfiguration
    ) {
        self.actionTitle = configuration.actionTitle
        self.action = configuration.action
    }
}

extension NewAction: View {
    public var body: some View {
        let configuration = NewActionConfiguration(actionTitle: .init(self.actionTitle), action: self.action)
        style.resolve(configuration: configuration).typeErased
            .transformEnvironment(\.newActionStyleStack) { stack in
                if !stack.isEmpty {
                    stack.removeLast()
                }
            }
    }
}

import Foundation
import SwiftUI

public struct NewAction<_ActionTitle: View>: _ActionComponent {
    var actionTitle: _ActionTitle
    var action: (() -> Void)?
    
    @Environment(\.newActionStyle) var style
    
    init<ActionTitle_: View>(actionTitle: () -> ActionTitle_, action: (() -> Void)? = nil) where _ActionTitle == ActionTitle<ActionTitle_> {
        self.actionTitle = ActionTitle { actionTitle() }
        self.action = action
    }
}

public extension NewAction where
    _ActionTitle == ActionTitle<Text>
{
    init(
        actionTitle: AttributedString,
        action: (() -> Void)? = nil
    ) {
        self.init(actionTitle: { Text(actionTitle) }, action: action)
    }
}

public extension NewAction where
    _ActionTitle == NewActionConfiguration.ActionTitle
{
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

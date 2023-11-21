import Foundation
import SwiftUI

public struct ActionView<ActionTitle: View>: _ActionComponent {
    var actionTitle: ActionTitle
    var action: (() -> Void)?
    
    init(@ViewBuilder actionTitle: () -> ActionTitle, action: (() -> Void)? = nil) {
        self.actionTitle = actionTitle()
        self.action = action
    }
}

extension ActionView: View {
    public var body: some View {
        Button(action: action ?? {}, label: { actionTitle })
    }
}

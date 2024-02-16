// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct CardFooter {
    let action: any View
    let secondaryAction: any View

    @Environment(\.cardFooterStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder action: () -> any View = { EmptyView() },
                @ViewBuilder secondaryAction: () -> any View = { EmptyView() })
    {
        self.action = Action { action() }
        self.secondaryAction = SecondaryAction { secondaryAction() }
    }
}

public extension CardFooter {
    init(action: FioriButton? = nil,
         secondaryAction: FioriButton? = nil)
    {
        self.init(action: { action }, secondaryAction: { secondaryAction })
    }
}

public extension CardFooter {
    init(_ configuration: CardFooterConfiguration) {
        self.action = configuration.action
        self.secondaryAction = configuration.secondaryAction
        self._shouldApplyDefaultStyle = false
    }
}

extension CardFooter: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(action: .init(self.action), secondaryAction: .init(self.secondaryAction))).typeErased
                .transformEnvironment(\.cardFooterStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CardFooter {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        CardFooter(.init(action: .init(self.action), secondaryAction: .init(self.secondaryAction)))
            .shouldApplyDefaultStyle(false)
            .cardFooterStyle(CardFooterFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

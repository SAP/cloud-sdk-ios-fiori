// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct CardFooter {
    let newAction: any View
    let secondaryAction: any View

    @Environment(\.cardFooterStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder newAction: () -> any View = { EmptyView() },
                @ViewBuilder secondaryAction: () -> any View = { EmptyView() })
    {
        self.newAction = NewAction { newAction() }
        self.secondaryAction = SecondaryAction { secondaryAction() }
    }
}

public extension CardFooter {
    init(newAction: FioriButton? = nil,
         secondaryAction: FioriButton? = nil)
    {
        self.init(newAction: { newAction }, secondaryAction: { secondaryAction })
    }
}

public extension CardFooter {
    init(_ configuration: CardFooterConfiguration) {
        self.newAction = configuration.newAction
        self.secondaryAction = configuration.secondaryAction
        self._shouldApplyDefaultStyle = false
    }
}

extension CardFooter: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(newAction: .init(self.newAction), secondaryAction: .init(self.secondaryAction))).typeErased
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
        CardFooter(.init(newAction: .init(self.newAction), secondaryAction: .init(self.secondaryAction)))
            .shouldApplyDefaultStyle(false)
            .cardFooterStyle(CardFooterFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

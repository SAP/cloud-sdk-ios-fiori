// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct CardFooter {
    let action: any View
    let secondaryAction: any View
    let tertiaryAction: any View
    let overflowAction: any View

    @Environment(\.cardFooterStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder action: () -> any View = { EmptyView() },
                @ViewBuilder secondaryAction: () -> any View = { EmptyView() },
                @ViewBuilder tertiaryAction: () -> any View = { EmptyView() },
                @ViewBuilder overflowAction: () -> any View = { FioriButton { _ in Image(systemName: "ellipsis") } })
    {
        self.action = Action { action() }
        self.secondaryAction = SecondaryAction { secondaryAction() }
        self.tertiaryAction = TertiaryAction { tertiaryAction() }
        self.overflowAction = OverflowAction { overflowAction() }
    }
}

public extension CardFooter {
    init(action: FioriButton? = nil,
         secondaryAction: FioriButton? = nil,
         tertiaryAction: FioriButton? = nil,
         overflowAction: FioriButton? = FioriButton { _ in Image(systemName: "ellipsis") })
    {
        self.init(action: { action }, secondaryAction: { secondaryAction }, tertiaryAction: { tertiaryAction }, overflowAction: { overflowAction })
    }
}

public extension CardFooter {
    init(_ configuration: CardFooterConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CardFooterConfiguration, shouldApplyDefaultStyle: Bool) {
        self.action = configuration.action
        self.secondaryAction = configuration.secondaryAction
        self.tertiaryAction = configuration.tertiaryAction
        self.overflowAction = configuration.overflowAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension CardFooter: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(action: .init(self.action), secondaryAction: .init(self.secondaryAction), tertiaryAction: .init(self.tertiaryAction), overflowAction: .init(self.overflowAction))).typeErased
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
        CardFooter(.init(action: .init(self.action), secondaryAction: .init(self.secondaryAction), tertiaryAction: .init(self.tertiaryAction), overflowAction: .init(self.overflowAction)))
            .shouldApplyDefaultStyle(false)
            .cardFooterStyle(CardFooterFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

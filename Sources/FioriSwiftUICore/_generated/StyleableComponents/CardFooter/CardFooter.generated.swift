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

    var componentIdentifier: String = CardFooter.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder action: () -> any View = { EmptyView() },
                @ViewBuilder secondaryAction: () -> any View = { EmptyView() },
                @ViewBuilder tertiaryAction: () -> any View = { EmptyView() },
                @ViewBuilder overflowAction: () -> any View = { FioriButton { _ in Image(systemName: "ellipsis") } },
                componentIdentifier: String? = CardFooter.identifier)
    {
        self.action = Action(action: action, componentIdentifier: componentIdentifier)
        self.secondaryAction = SecondaryAction(secondaryAction: secondaryAction, componentIdentifier: componentIdentifier)
        self.tertiaryAction = TertiaryAction(tertiaryAction: tertiaryAction, componentIdentifier: componentIdentifier)
        self.overflowAction = OverflowAction(overflowAction: overflowAction, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? CardFooter.identifier
    }
}

public extension CardFooter {
    static let identifier = "fiori_cardfooter_component"
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
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension CardFooter: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, action: .init(self.action), secondaryAction: .init(self.secondaryAction), tertiaryAction: .init(self.tertiaryAction), overflowAction: .init(self.overflowAction))).typeErased
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
        CardFooter(.init(componentIdentifier: self.componentIdentifier, action: .init(self.action), secondaryAction: .init(self.secondaryAction), tertiaryAction: .init(self.tertiaryAction), overflowAction: .init(self.overflowAction)))
            .shouldApplyDefaultStyle(false)
            .cardFooterStyle(CardFooterFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

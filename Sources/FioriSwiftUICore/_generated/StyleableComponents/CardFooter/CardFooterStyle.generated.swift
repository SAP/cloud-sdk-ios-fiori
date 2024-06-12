// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol CardFooterStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CardFooterConfiguration) -> Body
}

struct AnyCardFooterStyle: CardFooterStyle {
    let content: (CardFooterConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CardFooterConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CardFooterConfiguration {
    public let action: Action
    public let secondaryAction: SecondaryAction
    public let tertiaryAction: TertiaryAction
    public let overflowAction: OverflowAction

    public typealias Action = ConfigurationViewWrapper
    public typealias SecondaryAction = ConfigurationViewWrapper
    public typealias TertiaryAction = ConfigurationViewWrapper
    public typealias OverflowAction = ConfigurationViewWrapper
}

public struct CardFooterFioriStyle: CardFooterStyle {
    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        CardFooter(configuration)
            .actionStyle(ActionFioriStyle(cardFooterConfiguration: configuration))
            .secondaryActionStyle(SecondaryActionFioriStyle(cardFooterConfiguration: configuration))
            .tertiaryActionStyle(TertiaryActionFioriStyle(cardFooterConfiguration: configuration))
            .overflowActionStyle(OverflowActionFioriStyle(cardFooterConfiguration: configuration))
    }
}

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public var componentIdentifier: String = "fiori_cardfooter_component"
    public let action: Action
    public let secondaryAction: SecondaryAction
    public let tertiaryAction: TertiaryAction
    public let overflowAction: OverflowAction

    public typealias Action = ConfigurationViewWrapper
    public typealias SecondaryAction = ConfigurationViewWrapper
    public typealias TertiaryAction = ConfigurationViewWrapper
    public typealias OverflowAction = ConfigurationViewWrapper
}

public extension CardFooterConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var actionIdentifier: String {
        self.componentIdentifier + "_action"
    }

    var secondaryActionIdentifier: String {
        self.componentIdentifier + "_secondaryAction"
    }

    var tertiaryActionIdentifier: String {
        self.componentIdentifier + "_tertiaryAction"
    }

    var overflowActionIdentifier: String {
        self.componentIdentifier + "_overflowAction"
    }
}

extension CardFooterConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
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

public struct CardFooterNSSStyle: CardFooterStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: CardFooterConfiguration) -> some View {
        CardFooter(configuration)
            .actionStyle(ActionNSSStyle(cardFooterConfiguration: configuration, nssData: self.data.value(configuration.actionIdentifier)))
            .secondaryActionStyle(SecondaryActionNSSStyle(cardFooterConfiguration: configuration, nssData: self.data.value(configuration.secondaryActionIdentifier)))
            .tertiaryActionStyle(TertiaryActionNSSStyle(cardFooterConfiguration: configuration, nssData: self.data.value(configuration.tertiaryActionIdentifier)))
            .overflowActionStyle(OverflowActionNSSStyle(cardFooterConfiguration: configuration, nssData: self.data.value(configuration.overflowActionIdentifier)))
            .cardFooterStyle(ContentNSSStyle(cardFooterConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}

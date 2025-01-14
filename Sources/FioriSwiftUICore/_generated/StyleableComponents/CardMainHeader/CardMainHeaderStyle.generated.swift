// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol CardMainHeaderStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CardMainHeaderConfiguration) -> Body
}

struct AnyCardMainHeaderStyle: CardMainHeaderStyle {
    let content: (CardMainHeaderConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CardMainHeaderConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CardMainHeaderConfiguration {
    public var componentIdentifier: String = "fiori_cardmainheader_component"
    public let title: Title
    public let subtitle: Subtitle
    public let icons: Icons
    public let detailImage: DetailImage
    public let headerAction: HeaderAction
    public let counter: Counter

    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Icons = ConfigurationViewWrapper
    public typealias DetailImage = ConfigurationViewWrapper
    public typealias HeaderAction = ConfigurationViewWrapper
    public typealias Counter = ConfigurationViewWrapper
}

extension CardMainHeaderConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct CardMainHeaderFioriStyle: CardMainHeaderStyle {
    public func makeBody(_ configuration: CardMainHeaderConfiguration) -> some View {
        CardMainHeader(configuration)
            .titleStyle(TitleFioriStyle(cardMainHeaderConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(cardMainHeaderConfiguration: configuration))
            .iconsStyle(IconsFioriStyle(cardMainHeaderConfiguration: configuration))
            .detailImageStyle(DetailImageFioriStyle(cardMainHeaderConfiguration: configuration))
            .headerActionStyle(HeaderActionFioriStyle(cardMainHeaderConfiguration: configuration))
            .counterStyle(CounterFioriStyle(cardMainHeaderConfiguration: configuration))
    }
}

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol CardStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CardConfiguration) -> Body
}

struct AnyCardStyle: CardStyle {
    let content: (CardConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CardConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CardConfiguration {
    public var componentIdentifier: String = "fiori_card_component"
    public let mediaImage: MediaImage
    public let description: Description
    public let title: Title
    public let subtitle: Subtitle
    public let icons: Icons
    public let detailImage: DetailImage
    public let headerAction: HeaderAction
    public let counter: Counter
    public let row1: Row1
    public let row2: Row2
    public let row3: Row3
    public let kpi: Kpi
    public let kpiCaption: KpiCaption
    public let cardBody: CardBody
    public let action: Action
    public let secondaryAction: SecondaryAction
    public let tertiaryAction: TertiaryAction
    public let overflowAction: OverflowAction

    public typealias MediaImage = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Icons = ConfigurationViewWrapper
    public typealias DetailImage = ConfigurationViewWrapper
    public typealias HeaderAction = ConfigurationViewWrapper
    public typealias Counter = ConfigurationViewWrapper
    public typealias Row1 = ConfigurationViewWrapper
    public typealias Row2 = ConfigurationViewWrapper
    public typealias Row3 = ConfigurationViewWrapper
    public typealias Kpi = ConfigurationViewWrapper
    public typealias KpiCaption = ConfigurationViewWrapper
    public typealias CardBody = ConfigurationViewWrapper
    public typealias Action = ConfigurationViewWrapper
    public typealias SecondaryAction = ConfigurationViewWrapper
    public typealias TertiaryAction = ConfigurationViewWrapper
    public typealias OverflowAction = ConfigurationViewWrapper
}

extension CardConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct CardFioriStyle: CardStyle {
    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .mediaImageStyle(MediaImageFioriStyle(cardConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(cardConfiguration: configuration))
            .titleStyle(TitleFioriStyle(cardConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(cardConfiguration: configuration))
            .iconsStyle(IconsFioriStyle(cardConfiguration: configuration))
            .detailImageStyle(DetailImageFioriStyle(cardConfiguration: configuration))
            .headerActionStyle(HeaderActionFioriStyle(cardConfiguration: configuration))
            .counterStyle(CounterFioriStyle(cardConfiguration: configuration))
            .row1Style(Row1FioriStyle(cardConfiguration: configuration))
            .row2Style(Row2FioriStyle(cardConfiguration: configuration))
            .row3Style(Row3FioriStyle(cardConfiguration: configuration))
            .kpiStyle(KpiFioriStyle(cardConfiguration: configuration))
            .kpiCaptionStyle(KpiCaptionFioriStyle(cardConfiguration: configuration))
            .cardBodyStyle(CardBodyFioriStyle(cardConfiguration: configuration))
            .actionStyle(ActionFioriStyle(cardConfiguration: configuration))
            .secondaryActionStyle(SecondaryActionFioriStyle(cardConfiguration: configuration))
            .tertiaryActionStyle(TertiaryActionFioriStyle(cardConfiguration: configuration))
            .overflowActionStyle(OverflowActionFioriStyle(cardConfiguration: configuration))
            .cardHeaderStyle(CardHeaderFioriStyle(cardConfiguration: configuration))
            .cardFooterStyle(CardFooterFioriStyle(cardConfiguration: configuration))
    }
}

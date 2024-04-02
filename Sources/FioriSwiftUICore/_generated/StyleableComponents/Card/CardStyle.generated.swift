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
}

public struct CardFioriStyle: CardStyle {
    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .mediaImageStyle(MediaImageFioriStyle())
            .descriptionStyle(DescriptionFioriStyle())
            .titleStyle(TitleFioriStyle())
            .subtitleStyle(SubtitleFioriStyle())
            .iconsStyle(IconsFioriStyle())
            .detailImageStyle(DetailImageFioriStyle())
            .headerActionStyle(HeaderActionFioriStyle())
            .counterStyle(CounterFioriStyle())
            .row1Style(Row1FioriStyle())
            .row2Style(Row2FioriStyle())
            .row3Style(Row3FioriStyle())
            .kpiStyle(KpiFioriStyle())
            .kpiCaptionStyle(KpiCaptionFioriStyle())
            .cardBodyStyle(CardBodyFioriStyle())
            .actionStyle(ActionFioriStyle())
            .secondaryActionStyle(SecondaryActionFioriStyle())
            .cardHeaderStyle(CardHeaderFioriStyle())
            .cardFooterStyle(CardFooterFioriStyle())
    }
}

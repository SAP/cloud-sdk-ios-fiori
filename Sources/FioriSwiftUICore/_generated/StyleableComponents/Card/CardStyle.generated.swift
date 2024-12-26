// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public let contentIdentifier = "FioriCard_content"
    public let mediaImageIdentifier = "FioriCard_mediaImage"
    public let descriptionIdentifier = "FioriCard_description"
    public let titleIdentifier = "FioriCard_title"
    public let subtitleIdentifier = "FioriCard_subtitle"
    public let iconsIdentifier = "FioriCard_icons"
    public let detailImageIdentifier = "FioriCard_detailImage"
    public let headerActionIdentifier = "FioriCard_headerAction"
    public let counterIdentifier = "FioriCard_counter"
    public let row1Identifier = "FioriCard_row1"
    public let row2Identifier = "FioriCard_row2"
    public let row3Identifier = "FioriCard_row3"
    public let kpiIdentifier = "FioriCard_kpi"
    public let kpiCaptionIdentifier = "FioriCard_kpiCaption"
    public let cardBodyIdentifier = "FioriCard_cardBody"
    public let actionIdentifier = "FioriCard_action"
    public let secondaryActionIdentifier = "FioriCard_secondaryAction"
    public let tertiaryActionIdentifier = "FioriCard_tertiaryAction"
    public let overflowActionIdentifier = "FioriCard_overflowAction"
    public let cardHeaderIdentifier = "FioriCard_cardHeader"
    public let cardFooterIdentifier = "FioriCard_cardFooter"

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

public struct CardNSSStyle: CardStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: CardConfiguration) -> some View {
        Card(configuration)
            .mediaImageStyle(MediaImageNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.mediaImageIdentifier)))
            .descriptionStyle(DescriptionNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.descriptionIdentifier)))
            .titleStyle(TitleNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .subtitleStyle(SubtitleNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.subtitleIdentifier)))
            .iconsStyle(IconsNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.iconsIdentifier)))
            .detailImageStyle(DetailImageNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.detailImageIdentifier)))
            .headerActionStyle(HeaderActionNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.headerActionIdentifier)))
            .counterStyle(CounterNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.counterIdentifier)))
            .row1Style(Row1NSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.row1Identifier)))
            .row2Style(Row2NSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.row2Identifier)))
            .row3Style(Row3NSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.row3Identifier)))
            .kpiStyle(KpiNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.kpiIdentifier)))
            .kpiCaptionStyle(KpiCaptionNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.kpiCaptionIdentifier)))
            .cardBodyStyle(CardBodyNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.cardBodyIdentifier)))
            .actionStyle(ActionNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.actionIdentifier)))
            .secondaryActionStyle(SecondaryActionNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.secondaryActionIdentifier)))
            .tertiaryActionStyle(TertiaryActionNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.tertiaryActionIdentifier)))
            .overflowActionStyle(OverflowActionNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.overflowActionIdentifier)))
            .cardHeaderStyle(CardHeaderNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.cardHeaderIdentifier)))
            .cardFooterStyle(CardFooterNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.cardFooterIdentifier)))
            .cardStyle(ContentNSSStyle(cardConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}

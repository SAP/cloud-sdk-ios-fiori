// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol CardHeaderStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CardHeaderConfiguration) -> Body
}

struct AnyCardHeaderStyle: CardHeaderStyle {
    let content: (CardHeaderConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CardHeaderConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CardHeaderConfiguration {
    public let contentIdentifier = "FioriCardHeader_content"
    public let mediaImageIdentifier = "FioriCardHeader_mediaImage"
    public let descriptionIdentifier = "FioriCardHeader_description"
    public let titleIdentifier = "FioriCardHeader_title"
    public let subtitleIdentifier = "FioriCardHeader_subtitle"
    public let iconsIdentifier = "FioriCardHeader_icons"
    public let detailImageIdentifier = "FioriCardHeader_detailImage"
    public let headerActionIdentifier = "FioriCardHeader_headerAction"
    public let counterIdentifier = "FioriCardHeader_counter"
    public let row1Identifier = "FioriCardHeader_row1"
    public let row2Identifier = "FioriCardHeader_row2"
    public let row3Identifier = "FioriCardHeader_row3"
    public let kpiIdentifier = "FioriCardHeader_kpi"
    public let kpiCaptionIdentifier = "FioriCardHeader_kpiCaption"
    public let cardMediaIdentifier = "FioriCardHeader_cardMedia"
    public let cardMainHeaderIdentifier = "FioriCardHeader_cardMainHeader"
    public let cardExtHeaderIdentifier = "FioriCardHeader_cardExtHeader"

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
}

public struct CardHeaderFioriStyle: CardHeaderStyle {
    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .mediaImageStyle(MediaImageFioriStyle(cardHeaderConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(cardHeaderConfiguration: configuration))
            .titleStyle(TitleFioriStyle(cardHeaderConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(cardHeaderConfiguration: configuration))
            .iconsStyle(IconsFioriStyle(cardHeaderConfiguration: configuration))
            .detailImageStyle(DetailImageFioriStyle(cardHeaderConfiguration: configuration))
            .headerActionStyle(HeaderActionFioriStyle(cardHeaderConfiguration: configuration))
            .counterStyle(CounterFioriStyle(cardHeaderConfiguration: configuration))
            .row1Style(Row1FioriStyle(cardHeaderConfiguration: configuration))
            .row2Style(Row2FioriStyle(cardHeaderConfiguration: configuration))
            .row3Style(Row3FioriStyle(cardHeaderConfiguration: configuration))
            .kpiStyle(KpiFioriStyle(cardHeaderConfiguration: configuration))
            .kpiCaptionStyle(KpiCaptionFioriStyle(cardHeaderConfiguration: configuration))
            .cardMediaStyle(CardMediaFioriStyle(cardHeaderConfiguration: configuration))
            .cardMainHeaderStyle(CardMainHeaderFioriStyle(cardHeaderConfiguration: configuration))
            .cardExtHeaderStyle(CardExtHeaderFioriStyle(cardHeaderConfiguration: configuration))
    }
}

public struct CardHeaderNSSStyle: CardHeaderStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .mediaImageStyle(MediaImageNSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.mediaImageIdentifier)))
            .descriptionStyle(DescriptionNSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.descriptionIdentifier)))
            .titleStyle(TitleNSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .subtitleStyle(SubtitleNSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.subtitleIdentifier)))
            .iconsStyle(IconsNSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.iconsIdentifier)))
            .detailImageStyle(DetailImageNSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.detailImageIdentifier)))
            .headerActionStyle(HeaderActionNSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.headerActionIdentifier)))
            .counterStyle(CounterNSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.counterIdentifier)))
            .row1Style(Row1NSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.row1Identifier)))
            .row2Style(Row2NSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.row2Identifier)))
            .row3Style(Row3NSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.row3Identifier)))
            .kpiStyle(KpiNSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.kpiIdentifier)))
            .kpiCaptionStyle(KpiCaptionNSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.kpiCaptionIdentifier)))
            .cardMediaStyle(CardMediaNSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.cardMediaIdentifier)))
            .cardMainHeaderStyle(CardMainHeaderNSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.cardMainHeaderIdentifier)))
            .cardExtHeaderStyle(CardExtHeaderNSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.cardExtHeaderIdentifier)))
            .cardHeaderStyle(ContentNSSStyle(cardHeaderConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}

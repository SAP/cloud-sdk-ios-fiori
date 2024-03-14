// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
            .cardMediaStyle(CardMediaFioriStyle())
            .cardMainHeaderStyle(CardMainHeaderFioriStyle())
            .cardExtHeaderStyle(CardExtHeaderFioriStyle())
    }
}

// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
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
    public let detailImage: DetailImage
    public let counter: Counter
    public let row1: Row1
    public let row2: Row2
    public let row3: Row3

    public typealias MediaImage = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias DetailImage = ConfigurationViewWrapper
    public typealias Counter = ConfigurationViewWrapper
    public typealias Row1 = ConfigurationViewWrapper
    public typealias Row2 = ConfigurationViewWrapper
    public typealias Row3 = ConfigurationViewWrapper
}
    
public struct CardHeaderFioriStyle: CardHeaderStyle {
    public func makeBody(_ configuration: CardHeaderConfiguration) -> some View {
        CardHeader(configuration)
            .mediaImageStyle(MediaImageFioriStyle())
            .descriptionStyle(DescriptionFioriStyle())
            .titleStyle(TitleFioriStyle())
            .subtitleStyle(SubtitleFioriStyle())
            .detailImageStyle(DetailImageFioriStyle())
            .counterStyle(CounterFioriStyle())
            .row1Style(Row1FioriStyle())
            .row2Style(Row2FioriStyle())
            .row3Style(Row3FioriStyle())
            .cardMediaStyle(CardMediaFioriStyle())
            .cardMainHeaderStyle(CardMainHeaderFioriStyle())
            .cardExtHeaderStyle(CardExtHeaderFioriStyle())
    }
}

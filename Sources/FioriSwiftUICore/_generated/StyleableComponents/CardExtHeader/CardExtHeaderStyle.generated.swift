// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol CardExtHeaderStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CardExtHeaderConfiguration) -> Body
}

struct AnyCardExtHeaderStyle: CardExtHeaderStyle {
    let content: (CardExtHeaderConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CardExtHeaderConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CardExtHeaderConfiguration {
    public let contentIdentifier = "FioriCardExtHeader_content"
    public let row1Identifier = "FioriCardExtHeader_row1"
    public let row2Identifier = "FioriCardExtHeader_row2"
    public let row3Identifier = "FioriCardExtHeader_row3"
    public let kpiIdentifier = "FioriCardExtHeader_kpi"
    public let kpiCaptionIdentifier = "FioriCardExtHeader_kpiCaption"

    public let row1: Row1
    public let row2: Row2
    public let row3: Row3
    public let kpi: Kpi
    public let kpiCaption: KpiCaption

    public typealias Row1 = ConfigurationViewWrapper
    public typealias Row2 = ConfigurationViewWrapper
    public typealias Row3 = ConfigurationViewWrapper
    public typealias Kpi = ConfigurationViewWrapper
    public typealias KpiCaption = ConfigurationViewWrapper
}

public struct CardExtHeaderFioriStyle: CardExtHeaderStyle {
    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        CardExtHeader(configuration)
            .row1Style(Row1FioriStyle(cardExtHeaderConfiguration: configuration))
            .row2Style(Row2FioriStyle(cardExtHeaderConfiguration: configuration))
            .row3Style(Row3FioriStyle(cardExtHeaderConfiguration: configuration))
            .kpiStyle(KpiFioriStyle(cardExtHeaderConfiguration: configuration))
            .kpiCaptionStyle(KpiCaptionFioriStyle(cardExtHeaderConfiguration: configuration))
    }
}

public struct CardExtHeaderNSSStyle: CardExtHeaderStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: CardExtHeaderConfiguration) -> some View {
        CardExtHeader(configuration)
            .row1Style(Row1NSSStyle(cardExtHeaderConfiguration: configuration, nssData: self.data.value(configuration.row1Identifier)))
            .row2Style(Row2NSSStyle(cardExtHeaderConfiguration: configuration, nssData: self.data.value(configuration.row2Identifier)))
            .row3Style(Row3NSSStyle(cardExtHeaderConfiguration: configuration, nssData: self.data.value(configuration.row3Identifier)))
            .kpiStyle(KpiNSSStyle(cardExtHeaderConfiguration: configuration, nssData: self.data.value(configuration.kpiIdentifier)))
            .kpiCaptionStyle(KpiCaptionNSSStyle(cardExtHeaderConfiguration: configuration, nssData: self.data.value(configuration.kpiCaptionIdentifier)))
            .cardExtHeaderStyle(ContentNSSStyle(cardExtHeaderConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}

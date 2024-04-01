// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
            .row1Style(Row1FioriStyle())
            .row2Style(Row2FioriStyle())
            .row3Style(Row3FioriStyle())
            .kpiStyle(KpiFioriStyle())
            .kpiCaptionStyle(KpiCaptionFioriStyle())
    }
}

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol HeaderChartStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: HeaderChartConfiguration) -> Body
}

struct AnyHeaderChartStyle: HeaderChartStyle {
    let content: (HeaderChartConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (HeaderChartConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: HeaderChartConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct HeaderChartConfiguration {
    public var componentIdentifier: String = "fiori_headerchart_component"
    public let title: Title
    public let subtitle: Subtitle
    public let trend: Trend
    public let trendImage: TrendImage
    public let kpi: Kpi
    public let chart: Chart

    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Trend = ConfigurationViewWrapper
    public typealias TrendImage = ConfigurationViewWrapper
    public typealias Kpi = ConfigurationViewWrapper
    public typealias Chart = ConfigurationViewWrapper
}

extension HeaderChartConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct HeaderChartFioriStyle: HeaderChartStyle {
    public func makeBody(_ configuration: HeaderChartConfiguration) -> some View {
        HeaderChart(configuration)
            .titleStyle(TitleFioriStyle(headerChartConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(headerChartConfiguration: configuration))
            .trendStyle(TrendFioriStyle(headerChartConfiguration: configuration))
            .trendImageStyle(TrendImageFioriStyle(headerChartConfiguration: configuration))
            .kpiStyle(KpiFioriStyle(headerChartConfiguration: configuration))
    }
}

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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

public extension HeaderChartConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var titleIdentifier: String {
        self.componentIdentifier + "_title"
    }

    var subtitleIdentifier: String {
        self.componentIdentifier + "_subtitle"
    }

    var trendIdentifier: String {
        self.componentIdentifier + "_trend"
    }

    var trendImageIdentifier: String {
        self.componentIdentifier + "_trendImage"
    }

    var kpiIdentifier: String {
        self.componentIdentifier + "_kpi"
    }
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

public struct HeaderChartNSSStyle: HeaderChartStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: HeaderChartConfiguration) -> some View {
        HeaderChart(configuration)
            .titleStyle(TitleNSSStyle(headerChartConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .subtitleStyle(SubtitleNSSStyle(headerChartConfiguration: configuration, nssData: self.data.value(configuration.subtitleIdentifier)))
            .trendStyle(TrendNSSStyle(headerChartConfiguration: configuration, nssData: self.data.value(configuration.trendIdentifier)))
            .trendImageStyle(TrendImageNSSStyle(headerChartConfiguration: configuration, nssData: self.data.value(configuration.trendImageIdentifier)))
            .kpiStyle(KpiNSSStyle(headerChartConfiguration: configuration, nssData: self.data.value(configuration.kpiIdentifier)))
            .headerChartStyle(ContentNSSStyle(headerChartConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}

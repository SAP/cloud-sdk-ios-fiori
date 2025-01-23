// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `HeaderChart` is a view that displays an object's title, subtitle, trend, trend image and kpi.
/// ## Usage
/// ```swift
/// HeaderChart {
///     Text("title")
/// } subtitle: {
///     Text("subtitle")
/// } trend: {
///     Text("trend")
/// } trendImage: {
///     Image(systemName: "person")
/// } kpi: {
///     Text("KPI View")
/// } chart: {
///     Text("Chart View")
/// }
/// ```
public struct HeaderChart {
    let title: any View
    let subtitle: any View
    let trend: any View
    let trendImage: any View
    let kpi: any View
    let chart: any View

    @Environment(\.headerChartStyle) var style

    var componentIdentifier: String = HeaderChart.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder trend: () -> any View = { EmptyView() },
                @ViewBuilder trendImage: () -> any View = { EmptyView() },
                @ViewBuilder kpi: () -> any View = { EmptyView() },
                @ViewBuilder chart: () -> any View = { EmptyView() },
                componentIdentifier: String? = HeaderChart.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.trend = Trend(trend: trend, componentIdentifier: componentIdentifier)
        self.trendImage = TrendImage(trendImage: trendImage, componentIdentifier: componentIdentifier)
        self.kpi = Kpi(kpi: kpi, componentIdentifier: componentIdentifier)
        self.chart = chart()
        self.componentIdentifier = componentIdentifier ?? HeaderChart.identifier
    }
}

public extension HeaderChart {
    static let identifier = "fiori_headerchart_component"
}

public extension HeaderChart {
    init(title: AttributedString,
         subtitle: AttributedString? = nil,
         trend: AttributedString? = nil,
         trendImage: Image? = nil,
         kpi: KPIItemData? = nil,
         @ViewBuilder chart: () -> any View = { EmptyView() })
    {
        self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, trend: { OptionalText(trend) }, trendImage: { trendImage }, kpi: { OptionalKPIItem(kpi) }, chart: chart)
    }
}

public extension HeaderChart {
    init(_ configuration: HeaderChartConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: HeaderChartConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.trend = configuration.trend
        self.trendImage = configuration.trendImage
        self.kpi = configuration.kpi
        self.chart = configuration.chart
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension HeaderChart: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), subtitle: .init(self.subtitle), trend: .init(self.trend), trendImage: .init(self.trendImage), kpi: .init(self.kpi), chart: .init(self.chart))).typeErased
                .transformEnvironment(\.headerChartStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension HeaderChart {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        HeaderChart(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), subtitle: .init(self.subtitle), trend: .init(self.trend), trendImage: .init(self.trendImage), kpi: .init(self.kpi), chart: .init(self.chart)))
            .shouldApplyDefaultStyle(false)
            .headerChartStyle(HeaderChartFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

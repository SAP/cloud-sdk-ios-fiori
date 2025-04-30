import FioriThemeManager
import Foundation
import SwiftUI

public extension HeaderChart {
    /// Convenience initializer for `HeaderChart`
    /// - Parameters:
    ///   - title: The title string for the header chart.
    ///   - subtitle: The subtitle attributed string for the header chart.
    ///   - trend: The trend attributed string for the header chart.
    ///   - trendImage: The trend image for the header chart.
    ///   - kpi: Data used for `KPIItem` in header chart.
    ///   - chart: Chart for header chart.
    init(title: String,
         subtitle: AttributedString? = nil,
         trend: AttributedString? = nil,
         trendImage: Image? = nil,
         kpi: KPIItemData? = nil,
         @ViewBuilder chart: () -> any View = { EmptyView() })
    {
        self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, trend: { OptionalText(trend) }, trendImage: { trendImage }, kpi: { OptionalKPIItem(kpi) }, chart: chart)
    }
    
    /// Convenience initializer for `HeaderChart`
    /// - Parameters:
    ///   - title: The title string for the header chart.
    ///   - subtitle: The subtitle attributed string for the header chart.
    ///   - trend: The trend attributed string for the header chart.
    ///   - trendImage: The trend image for the header chart.
    ///   - kpi: The KPI string of header chart.
    ///   - chart: Chart for header chart.
    init(title: String,
         subtitle: AttributedString? = nil,
         trend: AttributedString? = nil,
         trendImage: Image? = nil,
         kpi: String? = nil,
         @ViewBuilder chart: () -> any View = { EmptyView() })
    {
        if let kpi {
            self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, trend: { OptionalText(trend) }, trendImage: { trendImage }, kpi: { Text(kpi) }, chart: chart)
        } else {
            self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, trend: { OptionalText(trend) }, trendImage: { trendImage }, kpi: { EmptyView() }, chart: chart)
        }
    }
}

// Base Layout style
public struct HeaderChartBaseStyle: HeaderChartStyle {
    @State var mainViewSize: CGSize = .init(width: 312, height: 0)
    
    /// :nodoc:
    public func makeBody(_ configuration: HeaderChartConfiguration) -> some View {
        // Add default layout here
        VStack(alignment: .leading) {
            configuration.title
            if !configuration.subtitle.isEmpty {
                Spacer().frame(height: 2)
                configuration.subtitle
            }
            Spacer().frame(height: 8)
            if !configuration.trend.isEmpty ||
                !configuration.trendImage.isEmpty,
                configuration.kpi.isEmpty,
                !configuration.chart.isEmpty
            {
                self.makeTrendAndChartView(configuration)
            } else {
                self.makeRegularView(configuration)
            }
        }
        .ifApply(!configuration.isSeparatorHidden, content: { content in
            VStack(spacing: 16) {
                content
                configuration.separator
            }
        })
        .sizeReader { size in
            DispatchQueue.main.async {
                self.mainViewSize = size
            }
        }
        .frame(width: max(100, min(312, self.mainViewSize.width)))
    }
    
    func makeTrendAndChartView(_ configuration: HeaderChartConfiguration) -> some View {
        HStack(alignment: .top, spacing: 20) {
            HStack(spacing: 4) {
                configuration.trendImage
                configuration.trend
            }
            
            configuration.chart.frame(height: 75)
        }
    }
    
    func makeRegularView(_ configuration: HeaderChartConfiguration) -> some View {
        HStack(alignment: .bottom, spacing: 20) {
            if !configuration.trend.isEmpty ||
                !configuration.trendImage.isEmpty ||
                !configuration.kpi.isEmpty
            {
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 4) {
                        configuration.trendImage
                        configuration.trend
                    }
                    
                    if !configuration.kpi.isEmpty {
                        configuration.kpi
                    }
                }
            }
            
            if !configuration.chart.isEmpty {
                configuration.chart.frame(height: 75)
            }
        }
    }
}

// Default fiori styles
extension HeaderChartFioriStyle {
    struct ContentFioriStyle: HeaderChartStyle {
        func makeBody(_ configuration: HeaderChartConfiguration) -> some View {
            HeaderChart(configuration)
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let headerChartConfiguration: HeaderChartConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .headline))
                .foregroundColor(.preferredColor(.primaryLabel))
                .lineLimit(1)
        }
    }
    
    struct SubtitleFioriStyle: SubtitleStyle {
        let headerChartConfiguration: HeaderChartConfiguration
        
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .font(.fiori(forTextStyle: .footnote))
                .foregroundColor(.preferredColor(.tertiaryLabel))
                .lineLimit(1)
        }
    }
    
    struct TrendFioriStyle: TrendStyle {
        let headerChartConfiguration: HeaderChartConfiguration
        
        func makeBody(_ configuration: TrendConfiguration) -> some View {
            Trend(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(.preferredColor(.tertiaryLabel))
                .lineLimit(1)
        }
    }
    
    struct TrendImageFioriStyle: TrendImageStyle {
        let headerChartConfiguration: HeaderChartConfiguration
        
        func makeBody(_ configuration: TrendImageConfiguration) -> some View {
            TrendImage(configuration)
                .font(.fiori(forTextStyle: .caption1))
                .foregroundColor(.preferredColor(.tertiaryLabel))
                .lineLimit(1)
        }
    }
    
    struct KpiFioriStyle: KpiStyle {
        let headerChartConfiguration: HeaderChartConfiguration
        
        func makeBody(_ configuration: KpiConfiguration) -> some View {
            Kpi(configuration)
        }
    }
    
    struct SeparatorFioriStyle: SeparatorStyle {
        let headerChartConfiguration: HeaderChartConfiguration
    
        func makeBody(_ configuration: SeparatorConfiguration) -> some View {
            Separator(configuration)
            // Add default style for Separator
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}

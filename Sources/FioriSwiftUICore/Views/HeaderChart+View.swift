import FioriCharts
import SwiftUI

extension Fiori {
    enum HeaderChart {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .headline))
                    .foregroundColor(.preferredColor(.primaryLabel))
                    .lineLimit(1)
            }
        }

        struct Subtitle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .footnote))
                    .foregroundColor(.preferredColor(.tertiaryLabel))
                    .lineLimit(1)
            }
        }
        
        struct Trend: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .subheadline))
                    .foregroundColor(.preferredColor(.tertiaryLabel))
                    .lineLimit(1)
            }
        }
        
        struct TrendImage: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.fiori(forTextStyle: .caption1))
                    .foregroundColor(.preferredColor(.tertiaryLabel))
                    .lineLimit(1)
            }
        }
        
        typealias TitleCumulative = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier
        typealias TrendCumulative = EmptyModifier
        typealias TrendImageCumulative = EmptyModifier
        typealias Kpi = EmptyModifier
        typealias KpiCumulative = EmptyModifier
        
        static let title = Title()
        static let subtitle = Subtitle()
        static let trend = Trend()
        static let trendImage = TrendImage()
        static let kpi = Kpi()
        static let titleCumulative = TitleCumulative()
        static let subtitleCumulative = SubtitleCumulative()
        static let trendCumulative = TrendCumulative()
        static let trendImageCumulative = TrendImageCumulative()
        static let kpiCumulative = KpiCumulative()
    }
}

extension HeaderChart: View {
    /// Minimum Width is 100 px, Maximum Width is 312 px
    public var body: some View {
        VStack(alignment: .leading) {
            title
            
            if !isSubtitleEmptyView {
                Spacer().frame(height: 2)
                
                subtitle
            }
            
            Spacer().frame(height: 8)
            
            if !isTrendEmptyView || !isTrendImageEmptyView, isKpiEmptyView, Chart.self != EmptyView.self {
                self.makeTrendandChartView()
            } else {
                self.makeRegularView()
            }
        }
        .modifier(SizeModifier())
        .onPreferenceChange(SizePreferenceKey.self) { size in
            DispatchQueue.main.async {
                self.mainViewSize = size
            }
        }
        .frame(width: max(100, min(312, mainViewSize.width)))
    }
    
    func makeTrendandChartView() -> some View {
        HStack(alignment: .top, spacing: 20) {
            HStack(spacing: 4) {
                trendImage
                trend
            }
            
            chart.frame(height: 75)
        }
    }
    
    func makeRegularView() -> some View {
        HStack(alignment: .bottom, spacing: 20) {
            if !isTrendEmptyView || !isTrendImageEmptyView || !isKpiEmptyView {
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 4) {
                        trendImage
                        trend
                    }
                    
                    if !isKpiEmptyView {
                        kpi
                    }
                }
            }
            
            if Chart.self != EmptyView.self {
                chart.frame(height: 75)
            }
        }
    }
}

struct HeaderChart_Preview: PreviewProvider {
    static var previews: some View {
        let chartModel = ChartModel(chartType: .line,
                                    data: [[10, 30, 45, 55, 40, 70, 80]],
                                    titlesForCategory: [["9AM", nil, nil, nil, nil, nil, "9PM"]],
                                    categoryAxis: ChartCategoryAxisAttributes(labelLayoutStyle: .range))
        chartModel.numericAxis.labels.isHidden = true
        chartModel.seriesAttributes[0].point.isHidden = true
        
        return Group {
            HeaderChart(title: "Temperature", subtitle: "20 min ago", trend: "11.5%", trendImage: Image(systemName: "triangle.fill"), kpi: "79°F") {
                ChartView(chartModel)
            }.previewLayout(.sizeThatFits)
            
            HeaderChart(title: {
                Text("Temperature")
            }, subtitle: {
                Text("20 min ago")
            }, trend: {
                Text("11.5%").foregroundColor(.green)
            }, trendImage: {
                Image(systemName: "triangle.fill").foregroundColor(.green)
            }, kpi: {
                KPIItem(data: .components([.metric("79"), .unit("°F")]), subtitle: "").disabled(true)
            }, chart: {
                ChartView(chartModel)
            }).previewLayout(.sizeThatFits)
            
            HeaderChart(title: {
                Text("Temperature")
            }, subtitle: {
                Text("20 min ago")
            }, trend: {
                Text("11.5%").foregroundColor(.green)
            }, trendImage: {
                Image(systemName: "triangle.fill").foregroundColor(.green)
            }, chart: {
                ChartView(chartModel)
            }).previewLayout(.sizeThatFits)
            
            HeaderChart(title: {
                Text("Temperature")
            }, subtitle: {
                Text("20 min ago")
            }, chart: {
                ChartView(chartModel)
            }).previewLayout(.sizeThatFits)
            
            HeaderChart(title: {
                Text("Temperature")
            }, subtitle: {
                Text("20 min ago")
            }, kpi: {
                KPIItem(data: .components([.metric("79"), .unit("°F")]), subtitle: "").disabled(true)
            }, chart: {
                ChartView(chartModel)
            }).previewLayout(.sizeThatFits)
            
            HeaderChart(title: {
                Text("Temperature")
            }, subtitle: {
                Text("20 min ago")
            }, trend: {
                Text("11.5%").foregroundColor(.green)
            }, trendImage: {
                Image(systemName: "triangle.fill").foregroundColor(.green)
            }, kpi: {
                KPIItem(data: .components([.metric("79"), .unit("°F")]), subtitle: "").disabled(true)
            }).previewLayout(.sizeThatFits)
            
            HeaderChart(title: {
                Text("Temperature")
            }, subtitle: {
                Text("20 min ago")
            }, trend: {
                Text("11.5%").foregroundColor(.green)
            }, trendImage: {
                Image(systemName: "triangle.fill").foregroundColor(.green)
            }).previewLayout(.sizeThatFits)
            
            HeaderChart(title: {
                Text("Temperature")
            }, subtitle: {
                Text("20 min ago")
            }, kpi: {
                KPIItem(data: .components([.metric("79"), .unit("°F")]), subtitle: "").disabled(true)
            }).previewLayout(.sizeThatFits)
            
            HeaderChart(title: {
                EmptyView()
            }, chart: {
                ChartView(chartModel)
            }).previewLayout(.sizeThatFits)
        }
    }
}

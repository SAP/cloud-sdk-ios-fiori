import FioriCharts
import FioriSwiftUICore
import SwiftUI

struct HeaderChartExample: ListDataProtocol {
    init(cellTapped: Binding<Bool>) {}
    init() {}
    
    func numberOfSections() -> Int {
        2
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch section {
        case 0:
            return 9
        default:
            return 1
        }
    }
    
    func titleForHeaderInSection(_ section: Int) -> String {
        switch section {
        default:
            return "Analytics: Header Chart Spec"
        }
    }
    
    func containAccessoryView(_ indexPath: IndexPath) -> Bool {
        false
    }
    
    func cellForRow(_ indexPath: IndexPath) -> AnyView {
        let chartModel = ChartModel(chartType: .line,
                                    data: [[10, 30, 45, 55, 40, 70, 80]],
                                    titlesForCategory: [["9AM", nil, nil, nil, nil, nil, "9PM"]],
                                    categoryAxis: ChartCategoryAxisAttributes(labelLayoutStyle: .range))
        chartModel.numericAxis.labels.isHidden = true
        chartModel.seriesAttributes[0].point.isHidden = true
        
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            let hc = HeaderChart(title: {
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
            })
            
            return AnyView(hc)
            
        case (0, 1):
            let hc = HeaderChart(title: {
                Text("Temperature")
            }, subtitle: {
                Text("20 min ago")
            }, trend: {
                Text("11.5%").foregroundColor(.green)
            }, trendImage: {
                Image(systemName: "triangle.fill").foregroundColor(.green)
            }, chart: {
                ChartView(chartModel)
            })
            return AnyView(hc)
            
        case (0, 2):
            let hc = HeaderChart(title: {
                Text("Temperature")
            }, subtitle: {
                Text("20 min ago")
            }, chart: {
                ChartView(chartModel)
            })
            return AnyView(hc)
            
        case (0, 3):
            let hc = HeaderChart(title: {
                Text("Temperature")
            }, subtitle: {
                Text("20 min ago")
            }, kpi: {
                KPIItem(data: .components([.metric("79"), .unit("°F")]), subtitle: "").disabled(true)
            }, chart: {
                ChartView(chartModel)
            })
            return AnyView(hc)
            
        case (0, 4):
            let hc = HeaderChart(title: {
                Text("Temperature")
            }, subtitle: {
                Text("20 min ago")
            }, trend: {
                Text("11.5%").foregroundColor(.green)
            }, trendImage: {
                Image(systemName: "triangle.fill").foregroundColor(.green)
            }, kpi: {
                KPIItem(data: .components([.metric("79"), .unit("°F")]), subtitle: "").disabled(true)
            })
            return AnyView(hc)
            
        case (0, 5):
            let hc = HeaderChart(title: {
                Text("Temperature")
            }, subtitle: {
                Text("20 min ago")
            }, trend: {
                Text("11.5%").foregroundColor(.green)
            }, trendImage: {
                Image(systemName: "triangle.fill").foregroundColor(.green)
            })
            return AnyView(hc)
            
        case (0, 6):
            let hc = HeaderChart(title: {
                Text("Temperature")
            }, subtitle: {
                Text("20 min ago")
            }, kpi: {
                KPIItem(data: .components([.metric("79"), .unit("°F")]), subtitle: "").disabled(true)
            })
            return AnyView(hc)
            
        case (0, 7):
            let hc = HeaderChart(title: {
                EmptyView()
            }, chart: {
                ChartView(chartModel)
            })
            return AnyView(hc)
            
        case (0, 8):
            let hc = HeaderChart(title: {
                Text("Temperature")
            }, subtitle: {
                Text("20 min ago")
            }, trend: {
                Text("11.5%").foregroundColor(.green)
            }, trendImage: {
                Image(systemName: "triangle.fill").foregroundColor(.green)
            }, kpi: {
                KPIItem(data: .components([.metric("12345678901234567890"), .unit("°F")]), subtitle: "").disabled(true)
            }, chart: {
                ChartView(chartModel)
            })
            
            return AnyView(hc)
            
        case (1, 0):
            let hc = HeaderChart(title: "Temperature", subtitle: "20 min ago", trend: "11.5%", trendImage: Image(systemName: "triangle.fill"), kpi: "79°F") {
                ChartView(chartModel)
            }
            return AnyView(hc)
        default:
            return AnyView(ObjectItem(title: "Lorem ipseum dolor", status: "Available"))
        }
    }
}

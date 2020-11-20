import FioriCharts
import Foundation

public struct AnalyticalContent: Decodable {
    public let chartType: String
    public let legend: AnalyticalLegend?
    public let plotArea: AnalyticalPlotArea?
    public let title: AnalyticalTitleAttributes?
    public let measureAxis: String?
    public let dimensionAxis: String?
    
    init(chartType: String, legend: AnalyticalLegend?, plotArea: AnalyticalPlotArea?, title: AnalyticalTitleAttributes?, measureAxis: String?, dimensionAxis: String?) {
        self.chartType = chartType
        self.legend = legend
        self.plotArea = plotArea
        self.title = title
        self.measureAxis = measureAxis
        self.dimensionAxis = dimensionAxis
    }
}

extension AnalyticalContent: Placeholding {
    public func replacingPlaceholders(withValuesIn objects: Any...) -> AnalyticalContent {
        let _chartType = self.chartType.replacingPlaceholders(withValuesIn: objects)
        let _measureAxis = self.measureAxis?.replacingPlaceholders(withValuesIn: objects)
        let _dimensionAxis = self.dimensionAxis?.replacingPlaceholders(withValuesIn: objects)
        let _legend = self.legend?.replacingPlaceholders(withValuesIn: objects)
        let _title = self.title?.replacingPlaceholders(withValuesIn: objects)
        let _plotArea = self.plotArea?.replacingPlaceholders(withValuesIn: objects)
        
        return .init(chartType: _chartType, legend: _legend, plotArea: _plotArea, title: _title, measureAxis: _measureAxis, dimensionAxis: _dimensionAxis)
    }
}

import Foundation

public struct AnalyticalPlotArea: Decodable {
    public let dataLabel: AnalyticalDataLabel?
    public let categoryAxisText: AnalyticalDataLabel?
    public let valueAxisText: AnalyticalDataLabel?
}

extension AnalyticalPlotArea: Placeholding {
    public func replacingPlaceholders(withValuesIn objects: Any...) -> AnalyticalPlotArea {
        let _dataLabel = self.dataLabel?.replacingPlaceholders(withValuesIn: objects)
        let _categoryAxisText = self.categoryAxisText?.replacingPlaceholders(withValuesIn: objects)
        let _valueAxisText = self.valueAxisText?.replacingPlaceholders(withValuesIn: objects)
        return AnalyticalPlotArea(dataLabel: _dataLabel, categoryAxisText: _categoryAxisText, valueAxisText: _valueAxisText)
    }
}

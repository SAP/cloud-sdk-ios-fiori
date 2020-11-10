import Foundation

public struct AnalyticalPlotArea: Decodable {
    public let dataLabel: AnalyticalDataLabel?
    public let categoryAxisText: AnalyticalDataLabel?
    public let valueAxisText: AnalyticalDataLabel?
}

extension AnalyticalPlotArea: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> AnalyticalPlotArea {
        let _dataLabel = self.dataLabel?.replacingPlaceholders(withValuesIn: object)
        let _categoryAxisText = self.categoryAxisText?.replacingPlaceholders(withValuesIn: object)
        let _valueAxisText = self.valueAxisText?.replacingPlaceholders(withValuesIn: object)
        return AnalyticalPlotArea(dataLabel: _dataLabel, categoryAxisText: _categoryAxisText, valueAxisText: _valueAxisText)
    }
}

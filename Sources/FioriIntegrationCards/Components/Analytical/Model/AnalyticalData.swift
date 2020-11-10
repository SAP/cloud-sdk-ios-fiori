import Foundation

public struct AnalyticalData: Decodable {
    public private(set) var measures: [[AnalyticalMeasureDimension]]? = nil
    public private(set) var dimensions: [[AnalyticalMeasureDimension]]? = nil
    
    private let _measures: [AnalyticalMeasureDimension]
    private let _dimensions: [AnalyticalMeasureDimension]
    
    private enum CodingKeys: String, CodingKey {
        case _measures = "measures", _dimensions = "dimensions"
    }
}

extension AnalyticalData: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> AnalyticalData {
        guard let array = object as? JSONArray else {
            print("WARN: \(object) must be an array.")
            return self
        }
        
        var measuresDict = [Int: [AnalyticalMeasureDimension]]()
        var dimensionsDict = [Int: [AnalyticalMeasureDimension]]()

        for i in 0 ..< array.count {
            for j in 0 ..< self._measures.count {
                measuresDict[j, default: []].append(self._measures[j].replacingPlaceholders(withValuesIn: array[i]))
            }
            for j in 0 ..< self._dimensions.count {
                dimensionsDict[j, default: []].append(self._dimensions[j].replacingPlaceholders(withValuesIn: array[i]))
            }
        }

        return .init(measures: measuresDict.values.flatMap { $0 }, dimensions: dimensionsDict.values.flatMap { $0 }, _measures: self._measures, _dimensions: self._dimensions)
    }
}

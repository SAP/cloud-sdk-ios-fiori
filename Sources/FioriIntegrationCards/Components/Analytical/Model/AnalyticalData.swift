//
//  AnalyticalData.swift
//  FioriIntegrationCards
//
//  Created by Stan Stadelman on 4/16/20.
//

import Foundation

public struct AnalyticalData: Decodable {
    public private(set) var measures: [[AnalyticalMeasureDimension]]? = nil
    public private(set) var dimensions: [[AnalyticalMeasureDimension]]? = nil
    
    private let _measures: [AnalyticalMeasureDimension]
    private let _dimensions: [AnalyticalMeasureDimension]
    
    private enum CodingKeys: String, CodingKey  {
        case _measures = "measures", _dimensions = "dimensions"
    }
}

extension AnalyticalData: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> AnalyticalData {
        guard let array = object as? JSONArray else {
            print("WARN: \(object) must be an array.")
            return self
        }
        
        var measuresDict = Dictionary<Int, Array<AnalyticalMeasureDimension>>()
        var dimensionsDict = Dictionary<Int, Array<AnalyticalMeasureDimension>>()

        for i in 0..<array.count {
            for j in 0..<_measures.count {
                measuresDict[j, default: []].append(_measures[j].replacingPlaceholders(withValuesIn: array[i]))
            }
            for j in 0..<_dimensions.count {
                dimensionsDict[j, default: []].append(_dimensions[j].replacingPlaceholders(withValuesIn: array[i]))
            }
        }

        return .init(measures: measuresDict.values.flatMap({ $0 }), dimensions: dimensionsDict.values.flatMap({ $0 }), _measures: _measures, _dimensions: _dimensions)
    }
    
    
}

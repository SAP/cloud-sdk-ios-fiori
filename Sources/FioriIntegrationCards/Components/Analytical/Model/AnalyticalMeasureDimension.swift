//
//  AnalyticalMeasureDimension.swift
//  FioriIntegrationCards
//
//  Created by Ma, Xiao on 3/11/20.
//

import Foundation

public struct AnalyticalMeasureDimension: Decodable {
    public let label: String
    public let value: String
}

extension AnalyticalMeasureDimension: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> AnalyticalMeasureDimension {
        let _label = label.replacingPlaceholders(withValuesIn: object)
        let _value = value.replacingPlaceholders(withValuesIn: object)
        return .init(label: _label, value: _value)
    }
}

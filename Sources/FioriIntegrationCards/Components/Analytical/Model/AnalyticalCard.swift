//
//  AnalyticalCard.swift
//  DevTest
//
//  Created by Ma, Xiao on 1/23/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

//import AnyCodable
import Foundation
import Combine
import FioriCharts


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
        let x = array.map({
            item in
            self._measures.map({ $0.replacingPlaceholders(withValuesIn: item) })
        })
        let y = array.map({ item in self._dimensions.map({ $0.replacingPlaceholders(withValuesIn: item) })})
        return .init(measures: x, dimensions: y, _measures: _measures, _dimensions: _dimensions)
    }
    
    
}

/// Content data `path` should resolve to JSON array
public class AnalyticalCard: BaseBaseCard {
    
    @Published var content: AnalyticalContent?
    @Published var chartData: AnalyticalData?
    
    private var template: AnalyticalContent
    private var chartDataTemplate: AnalyticalData
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BaseCardCodingKeys.self)
        template = try container.decode(AnalyticalContent.self, forKey: .content)
        chartDataTemplate = try container.decode(AnalyticalData.self, forKey: .content)
        
        try super.init(from: decoder)
        
        contentPublisher
            .compactMap({ $0?.value })
            .tryMap({ [unowned self] value -> (Any, String?) in
                let json = try JSONSerialization.jsonObject(with: value.0, options: .mutableContainers)
                self.content = self.template.replacingPlaceholders(withValuesIn: json)
                return (json, value.1)
            })
            .compactMap({ o -> JSONArray? in
                return `Any`.resolve(o.0, keyPath: o.1, separator: "/") as? JSONArray
            })
            .sink(receiveCompletion: {
                switch $0 {
                    case .failure(let error):
                        print(error)
                    case .finished:
                        print("FINISHED")
                }
            }, receiveValue: { [unowned self] object in
                let data = self.chartDataTemplate.replacingPlaceholders(withValuesIn: object)
                guard let series = data.measures?.map({ $0.map({ Double($0.value) ?? 0.0 })}) else { preconditionFailure() }
                let seriesTitles = data.measures?.map({ $0.map({ $0.label })})
                let axesLabels = data.dimensions?.map({ $0.map({ $0.value }) })
                let axesTitles = data.dimensions?.map({ $0.map({ $0.label} )})
                
                let m = ChartModel(chartType: .line, data: [series])

                
//                let model = ChartModel(chartType: .line, data: [series], titlesForCategory: axesLabels, colorsForCategory: nil, titlesForAxis: axesTitles?.first, labelsForDimension: seriesTitles, selectedSeriesIndex: nil, userInteractionEnabled: true, seriesAttributes: nil, categoryAxis: nil, numericAxis: nil, secondaryNumericAxis: nil)
                self.chartModel = m
            })
            .store(in: &subscribers)
        
    }
    
    @Published var chartModel: ChartModel = ChartModel(chartType: .line, data: Array<Array<Double>>())
}

extension AnalyticalCard: Hashable {
    public static func == (lhs: AnalyticalCard, rhs: AnalyticalCard) -> Bool {
        return lhs.header == rhs.header
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(header)
    }
}

public struct BackedDouble: Decodable {
    public var value: Double?
    var placeholder: String? = nil
    
    init(value: Double?, placeholder: String?) {
        self.value = value
        self.placeholder = placeholder
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        value = try? container.decode(Double.self)
        guard value != nil else {
            placeholder = try? container.decode(String.self)
            if let placeholder = placeholder {
                value = Double(placeholder)
            }
            return
        }
    }
}

extension BackedDouble: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> BackedDouble {
        guard value == nil,
            let _placeholder = placeholder else { return self }
        let converted = _placeholder.replacingPlaceholders(withValuesIn: object)
        let _value = Double(converted)
        return BackedDouble(value: _value, placeholder: _placeholder)
    }
}



public struct DataCategory: Identifiable, Decodable {
    public let id: UUID = UUID()
    public let names: [String]
    public let points: [DataPoint]
}

extension DataCategory: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> DataCategory {
        let _names = names.map({ $0.replacingPlaceholders(withValuesIn: object) })
        let _points = points.map({ $0.replacingPlaceholders(withValuesIn: object) })
        return DataCategory(names: _names, points: _points)
    }
}

public struct DataPoint: Identifiable, Decodable {
    public let id: UUID = UUID()
    public let series: String
    public let value: BackedDouble   // y value in most charts, sometimes the x in horizontal charts
    public let secondaryValue: BackedDouble? // would be used in scatter and bubble charts
    public let tertiaryValue: BackedDouble?  // would be used in bubble charts
}

extension DataPoint: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> DataPoint {
        let _series = series.replacingPlaceholders(withValuesIn: object)
        let _value = value.replacingPlaceholders(withValuesIn: object)
        let _secondaryValue = secondaryValue?.replacingPlaceholders(withValuesIn: object)
        let _tertiaryValue = tertiaryValue?.replacingPlaceholders(withValuesIn: object)
        return DataPoint(series: _series, value: _value, secondaryValue: _secondaryValue, tertiaryValue: _tertiaryValue)
    }
}

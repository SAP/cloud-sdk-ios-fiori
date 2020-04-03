//
//  AnalyticalCard.swift
//  DevTest
//
//  Created by Ma, Xiao on 1/23/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import AnyCodable
import Foundation

public class AnalyticalCard: BaseBaseCard {
    
    public enum ContentKeys: CodingKey {
        case chartType
        case legend
        case plotArea
        case title
        case measureAxis
        case dimensionAxis
        case measures
        case dimensions
    }
    
    @Published var content: AnalyticalContent?
    private var template: AnalyticalContent
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BaseCardCodingKeys.self)
        template = try container.decode(AnalyticalContent.self, forKey: .content)
        
        try super.init(from: decoder)
        
        contentPublisher
            .compactMap({ $0?.value })
            .tryMap({ try JSONSerialization.jsonObject(with: $0, options: .mutableContainers)})
            .map({ $0 })
            .sink(receiveCompletion: {
                switch $0 {
                    case .failure(let error):
                        print(error)
                    case .finished:
                        print("FINISHED")
                }
            }, receiveValue: { [unowned self] object in
                self.content = self.template.replacingPlaceholders(withValuesIn: object)
            })
            .store(in: &subscribers)
        
    }
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

public struct AnalyticalContent: Decodable {
    public let chartType: String
    public let legend: AnalyticalLegend?
    public let plotArea: AnalyticalPlotArea?
    public let title: AnalyticalTitleAttributes?
    public let measureAxis: String?
    public let dimensionAxis: String?
    public let measures: [AnalyticalMeasureDimension]
    public let dimensions: [AnalyticalMeasureDimension]
    public var categories: [DataCategory] = []
    
    private enum CodingKeys: CodingKey {
        case chartType, legend, plotArea, title, measureAxis, dimensionAxis, measures, dimensions
    }
    
}

extension AnalyticalContent: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> AnalyticalContent {
        let _chartType       = chartType.replacingPlaceholders(withValuesIn: object)
        let _measureAxis     = measureAxis?.replacingPlaceholders(withValuesIn: object)
        let _dimensionAxis   = dimensionAxis?.replacingPlaceholders(withValuesIn: object)
        let _legend          = legend?.replacingPlaceholders(withValuesIn: object)
        let _title           = title?.replacingPlaceholders(withValuesIn: object)
        let _plotArea        = plotArea?.replacingPlaceholders(withValuesIn: object)
        let _measures        = measures.map { $0.replacingPlaceholders(withValuesIn: object) }
        let _dimensions      = dimensions.map { $0.replacingPlaceholders(withValuesIn: object) }
        let _data            = categories.map({ $0.replacingPlaceholders(withValuesIn: object)})
        return .init(chartType: _chartType, legend: _legend, plotArea: _plotArea, title: _title, measureAxis: _measureAxis, dimensionAxis: _dimensionAxis, measures: _measures, dimensions: _dimensions, categories: _data)
    }
}

public struct Template: Decodable {
    public let chartType: String
    public let legend: AnalyticalLegend?
    public let plotArea: AnalyticalPlotArea?
    public let title: AnalyticalTitleAttributes?
    public let measureAxis: String?
    public let dimensionAxis: String?
    public let measures: [AnalyticalMeasureDimension]
    public let dimensions: [AnalyticalMeasureDimension]
    
    init(from container: KeyedDecodingContainer<AnalyticalCard.ContentKeys>) throws {
        chartType       = try container.decode(String.self, forKey: .chartType)
        legend          = try container.decode(AnalyticalLegend.self, forKey: .legend)
        plotArea        = try container.decode(AnalyticalPlotArea.self, forKey: .plotArea)
        title           = try container.decode(AnalyticalTitleAttributes.self, forKey: .title)
        measureAxis     = try container.decode(String.self, forKey: .measureAxis)
        dimensionAxis   = try container.decode(String.self, forKey: .dimensionAxis)
        measures        = try container.decode([AnalyticalMeasureDimension].self, forKey: .measures)
        dimensions      = try container.decode([AnalyticalMeasureDimension].self, forKey: .dimensions)
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

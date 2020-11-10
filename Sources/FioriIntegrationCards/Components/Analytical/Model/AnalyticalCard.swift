import Combine
import FioriCharts
// import AnyCodable
import Foundation

/// Content data `path` should resolve to JSON array
public class AnalyticalCard: BackingCard {
    @Published var content: AnalyticalContent?
    @Published var chartData: AnalyticalData?
    
    private var template: AnalyticalContent
    private var chartDataTemplate: AnalyticalData
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: BaseCardCodingKeys.self)
        self.template = try container.decode(AnalyticalContent.self, forKey: .content)
        self.chartDataTemplate = try container.decode(AnalyticalData.self, forKey: .content)
        
        try super.init(from: decoder)
        
        contentPublisher
            .compactMap { $0?.value }
            .tryMap { [unowned self] value -> (Any, String?) in
                let json = try JSONSerialization.jsonObject(with: value.0, options: .mutableContainers)
                self.content = self.template.replacingPlaceholders(withValuesIn: json)
                return (json, value.1)
            }
            .compactMap { o -> JSONArray? in
                `Any`.resolve(o.0, keyPath: o.1, separator: "/") as? JSONArray
            }
            .sink(receiveCompletion: {
                switch $0 {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("FINISHED")
                }
            }, receiveValue: { [unowned self] object in
                let data = self.chartDataTemplate.replacingPlaceholders(withValuesIn: object)
                guard let chartType = ChartType(from: self.content!.chartType),
                      let series = data.measures.map({ $0.map { $0.compactMap { Double($0.value) } } }) else { preconditionFailure() }
                let sortedSeries = series.sorted { (array1, array2) -> Bool in
                    array1.reduce(0, +) < array2.reduce(0, +)
                }
                let labelsForDimension: [[String?]]? = data.measures?.map { $0.map { $0.label } }
                let titlesForCategory: [[String?]]? = data.dimensions?.map { $0.map { $0.value } }
                // let axesTitles: [String]? = data.dimensions?.map({ $0.map({ $0.label }).first ?? "" })
                
                let model = ChartModel(chartType: chartType, data: sortedSeries, titlesForCategory: titlesForCategory, colorsForCategory: nil, titlesForAxis: nil, labelsForDimension: labelsForDimension)
                self.chartModel = model
            })
            .store(in: &subscribers)
    }
    
    @Published var chartModel = ChartModel(chartType: .line, data: [[Double]]())
}

extension ChartType {
    init?(from analyticalCardType: String) {
        switch analyticalCardType.lowercased() {
        case "line":
            self = .line
        case "stackedbar":
            self = .bar
        case "stackedcolumn":
            self = .stackedColumn
        case "donut":
            self = .donut
        default:
            return nil
        }
    }
}

extension AnalyticalCard: Hashable {
    public static func == (lhs: AnalyticalCard, rhs: AnalyticalCard) -> Bool {
        lhs.header == rhs.header
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
        
        self.value = try? container.decode(Double.self)
        guard self.value != nil else {
            self.placeholder = try? container.decode(String.self)
            if let placeholder = placeholder {
                self.value = Double(placeholder)
            }
            return
        }
    }
}

extension BackedDouble: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> BackedDouble {
        guard self.value == nil,
              let _placeholder = placeholder else { return self }
        let converted = _placeholder.replacingPlaceholders(withValuesIn: object)
        let _value = Double(converted)
        return BackedDouble(value: _value, placeholder: _placeholder)
    }
}

public struct DataCategory: Identifiable, Decodable {
    public let id = UUID()
    public let names: [String]
    public let points: [DataPoint]
}

extension DataCategory: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> DataCategory {
        let _names = self.names.map { $0.replacingPlaceholders(withValuesIn: object) }
        let _points = self.points.map { $0.replacingPlaceholders(withValuesIn: object) }
        return DataCategory(names: _names, points: _points)
    }
}

public struct DataPoint: Identifiable, Decodable {
    public let id = UUID()
    public let series: String
    public let value: BackedDouble // y value in most charts, sometimes the x in horizontal charts
    public let secondaryValue: BackedDouble? // would be used in scatter and bubble charts
    public let tertiaryValue: BackedDouble? // would be used in bubble charts
}

extension DataPoint: Placeholding {
    public func replacingPlaceholders(withValuesIn object: Any) -> DataPoint {
        let _series = self.series.replacingPlaceholders(withValuesIn: object)
        let _value = self.value.replacingPlaceholders(withValuesIn: object)
        let _secondaryValue = self.secondaryValue?.replacingPlaceholders(withValuesIn: object)
        let _tertiaryValue = self.tertiaryValue?.replacingPlaceholders(withValuesIn: object)
        return DataPoint(series: _series, value: _value, secondaryValue: _secondaryValue, tertiaryValue: _tertiaryValue)
    }
}

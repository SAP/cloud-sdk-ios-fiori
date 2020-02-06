//
//  Card.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/22/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
import AnyCodable


public enum Card: Decodable, Identifiable, CustomStringConvertible {
    case list(ListCard)
    case table(TableCard)
    case object(ObjectCard)
    case timeline(TimelineCard)
    case analytical(AnalyticalCard)

    public var id: String {
        return self.description
    }
    
    public var description: String {
        switch self {
        case .list: return "List"
        case .table: return "Table"
        case .object: return "Object"
        case .timeline: return "Timeline"
        case .analytical: return "Analytical"
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: HavingType.CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        
        switch type {
        case "List":
            let value = try ListCard(from: decoder)
            self = .list(value)
        case "Table":
            let value = try TableCard(from: decoder)
            self = .table(value)
        case "Object":
            let value = try ObjectCard(from: decoder)
            self = .object(value)
        case "Timeline":
            let value = try TimelineCard(from: decoder)
            self = .timeline(value)
        case "Analytical":
            let value = try AnalyticalCard(from: decoder)
            self = .analytical(value)
        default:
            let context = DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Could not decode Card from \(type)")
            throw DecodingError.dataCorrupted(context)
        }
    }
}

extension Card: Hashable {
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .list(let val):
            hasher.combine(val)
        case .table(let val):
            hasher.combine(val)
        case .object(let val):
            hasher.combine(val)
        case .timeline(let val):
            hasher.combine(val)
        case .analytical(let val):
            hasher.combine(val)
        }
    }
}



//public struct TableCard: Decodable {
//    public var rows: [TableRow]
//}

public struct TableRow: Identifiable, Decodable, Hashable {
    public let columns: [TableColumn]?
    public let actions: [Action]?
    public let id: UUID = UUID()
}

public struct TableColumn: Identifiable, Decodable, Hashable {
    public let title: String?
    public let width: String?
    public let value: String?
    public let icon: Icon?
    public let state: String?
    public let url: String?
    public let target: String?
    public let identifier: Bool?
    public let progressIndicator: String?
    public let id: UUID = UUID()
}

//public struct ObjectCard: Decodable {
//    public let groups: [ObjectGroup]
//}

public struct ObjectGroup: Decodable, Identifiable, Hashable {
    public let title: String
    public let items: [ObjectGroupItem]
    public let id: UUID = UUID()
}

public struct ObjectGroupItem: Decodable, Identifiable, Hashable {
    public let icon: Icon?
    public let label: String
    public let value: String
    public let type: String?
    public let url: String?
    public let target: String?
    public let emailSubject: String?
    public let id: UUID = UUID()
}

//public struct TimelineCard: Decodable {
//    public let items: [TimelineItem]
//}

public struct TimelineItem: Identifiable, Decodable, Hashable {
    public let title: String
    public let description: String?
    public let dateTime: String?
    public let owner: String?
    public let ownerImage: String?
    public let icon: Icon?
    public let id: UUID = UUID()
}

//public struct AnalyticalCard: Decodable {
//    public let chartType: String
//    public let legend: AnalyticalLegend?
//    public let plotArea: AnalyticalPlotArea?
//    public let title: AnalyticalTitleAttributes?
//    public let measureAxis: String?
//    public let dimensionAxis: String?
//    public let measures: [AnalyticalMeasureDimension]
//    public let dimensions: [AnalyticalMeasureDimension]
//}

public struct AnalyticalMeasureDimension: Decodable {
    public let label: String
    public let value: String
}

public struct AnalyticalLegend: Decodable {
    public let title: String?
    public let drawingEffect: String?
    public let isHierarchical: Bool?
    public let isScrollable: Bool?
    public let isVisible: Bool?
    
    enum CodingKeys: String, CodingKey {
        case title, drawingEffect, isHierarchical, isScrollable, isVisible = "visible"
    }
}

public struct AnalyticalPlotArea: Decodable {
    public let dataLabel: AnalyticalDataLabel?
    public let categoryAxisText: AnalyticalDataLabel?
    public let valueAxisText: AnalyticalDataLabel?
}

public struct AnalyticalTitleAttributes: Decodable {
    public let text: String
    public let isVisible: Bool?
    public let alignment: String?
    
    enum CodingKeys: String, CodingKey {
        case text, alignment, isVisible = "visible"
    }
}

public struct AnalyticalDataLabel: Decodable {
    public let isVisible: Bool?
    public let isShowingTotal: Bool?
    
    enum CodingKeys: String, CodingKey {
        case isVisible = "visible"
        case isShowingTotal = "showTotal"
    }
}





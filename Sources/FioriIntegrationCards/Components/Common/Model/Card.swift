//
//  Card.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/22/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation

public enum Card: Decodable, Identifiable, CustomStringConvertible {
    case list(ListCard)
    case table(TableCard)
    case object(ObjectCard)
    case timeline(TimelineCard)
    case analytical(AnalyticalCard)

    public var id: String {
        switch self {
        case .list(let val):
            return val.id
        case .table(let val):
            return val.id
        case .object(let val):
            return val.id
        case .timeline(let val):
            return val.id
        case .analytical(let val):
            return val.id
        }
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
    
    public func loadDataIfNeeded(baseURL: String?) {
        switch self {
        case .timeline(let card):
            card.baseURL.send(baseURL)
        default:
            break
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

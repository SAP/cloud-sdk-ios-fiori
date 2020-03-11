//
//  Header.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/20/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation

public enum Header: Decodable {
    case `default`(DefaultHeader)
    case numeric(NumericHeader)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: HavingType.CodingKeys.self)
        let type = try? container.decodeIfPresent(String.self, forKey: .type)
        
        switch type {
        case .some(let value) where value == "Default":
            let value = try DefaultHeader(from: decoder)
            self = .default(value)
        case .some(let value) where value == "Numeric":
            let value = try NumericHeader(from: decoder)
            self = .numeric(value)
        default:
            let value = try DefaultHeader(from: decoder)
            self = .default(value)
        }
    }
}

extension Header: Hashable {
    
}

struct HavingType: Decodable {
    let type: String?
    
    enum CodingKeys: CodingKey {
        case type
    }
}

public struct DefaultHeader: Decodable, Hashable {
    public let type: String?
    public let title: String
    public let subTitle: String?
    public let actions: [Action]?
    public let icon: Icon?
    public let status: Status?
}

extension DefaultHeader: Equatable {
    public static func == (lhs: DefaultHeader, rhs: DefaultHeader) -> Bool {
        return lhs.type == rhs.type &&
            lhs.title == rhs.title &&
            lhs.subTitle == rhs.subTitle &&
            lhs.actions == rhs.actions &&
            lhs.icon == rhs.icon &&
            lhs.status == rhs.status
        
    }
    
    
}

public struct NumericHeader: Decodable, Hashable {
    public let type: String
    public let title: String
    public let subTitle: String?
    public let actions: [Action]?
    public let unitOfMeasurement: String?
    public let mainIndicator: MainIndicator?
    public let details: String?
    public let sideIndicators: [SideIndicator]?
    public let status: Status?
}

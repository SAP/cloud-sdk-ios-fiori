//
//  Header.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/20/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
import Combine

public enum Header: Decodable, Hashable {
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

extension Header: Placeholding {
    public func replacingPlaceholders(withValuesIn dictionary: Dictionary<String, Any>) -> Header {
        switch self {
            case .default(let header):
                return .default(header.replacingPlaceholders(withValuesIn: dictionary))
            case .numeric(let header):
                return .numeric(header.replacingPlaceholders(withValuesIn: dictionary))
        }
    }
}

//
//  App.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/22/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation


public struct App: Codable, Identifiable, Hashable {
    public let id: String
    public let type: String
    public let title: String?
    public let subTitle: String?
    public let dataSources: [String: DataSource]
    
    private enum CodingKeys: String, CodingKey {
        case id
        case type
        case title
        case subTitle
        case dataSources
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        type = try container.decode(String.self, forKey: .type)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        subTitle = try container.decodeIfPresent(String.self, forKey: .subTitle)
        dataSources = try container.decodeIfPresent([String: DataSource].self, forKey: .dataSources) ?? [:]
        
    }
}

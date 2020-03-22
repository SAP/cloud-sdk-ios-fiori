//
//  DataSource.swift
//  AnyCodable
//
//  Created by Stan Stadelman on 3/21/20.
//

import Foundation

public struct DataSource: Codable, Hashable {
    // URL to the data source.
    let uri: String
    // Either `OData` or `JSON`; defaults to `JSON`.
    let type: String?
}

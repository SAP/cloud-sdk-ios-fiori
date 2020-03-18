//
//  HavingHeader.swift
//  FioriSwiftUI
//
//  Created by Stan Stadelman on 3/18/20.
//

import Foundation

public struct HavingHeader: Decodable {
    enum CodingKeys: CodingKey {
        case header
    }
    let header: Header
}

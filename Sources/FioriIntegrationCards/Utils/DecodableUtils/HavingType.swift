//
//  HavingType.swift
//  FioriSwiftUI
//
//  Created by Stan Stadelman on 3/18/20.
//

import Foundation

struct HavingType: Decodable {
    let type: String?
    
    enum CodingKeys: CodingKey {
        case type
    }
}

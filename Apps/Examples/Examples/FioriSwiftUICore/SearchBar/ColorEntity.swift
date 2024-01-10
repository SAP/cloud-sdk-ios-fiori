//
//  ColorEntity.swift
//  Examples
//
//  Created by Xu, Charles on 12/19/23.
//  Copyright © 2023 SAP. All rights reserved.
//

import Foundation
import SwiftUI

struct ColorEntity: Identifiable {
    let id = UUID().uuidString
    let name: String
    let fioriColor: Color
    
    static let colors = [
        ColorEntity(name: "Gray", fioriColor: .preferredColor(.grey6)),
        ColorEntity(name: "Blue", fioriColor: .preferredColor(.blue6)),
        ColorEntity(name: "Teal", fioriColor: .preferredColor(.teal6)),
        ColorEntity(name: "Green", fioriColor: .preferredColor(.green6)),
        ColorEntity(name: "Mango", fioriColor: .preferredColor(.mango6)),
        ColorEntity(name: "Red", fioriColor: .preferredColor(.red6)),
        ColorEntity(name: "Pink", fioriColor: .preferredColor(.pink6)),
        ColorEntity(name: "Raspberry", fioriColor: .preferredColor(.raspberry6)),
        ColorEntity(name: "Tint Color", fioriColor: .preferredColor(.tintColor)),
        ColorEntity(name: "Tint Color 2", fioriColor: .preferredColor(.tintColor2)),
        ColorEntity(name: "Chart 1", fioriColor: .preferredColor(.chart1)),
        ColorEntity(name: "Chart 2", fioriColor: .preferredColor(.chart2)),
        ColorEntity(name: "Chart 3", fioriColor: .preferredColor(.chart3)),
        ColorEntity(name: "Chart 4", fioriColor: .preferredColor(.chart4)),
        ColorEntity(name: "Chart 5", fioriColor: .preferredColor(.chart5)),
        ColorEntity(name: "Chart 6", fioriColor: .preferredColor(.chart6)),
        ColorEntity(name: "Chart 7", fioriColor: .preferredColor(.chart7)),
        ColorEntity(name: "Chart 8", fioriColor: .preferredColor(.chart8)),
        ColorEntity(name: "Chart 9", fioriColor: .preferredColor(.chart9)),
        ColorEntity(name: "Chart 10", fioriColor: .preferredColor(.chart10)),
        ColorEntity(name: "Chart 11", fioriColor: .preferredColor(.chart11)),
        ColorEntity(name: "Map 1", fioriColor: .preferredColor(.map1)),
        ColorEntity(name: "Map 2", fioriColor: .preferredColor(.map2)),
        ColorEntity(name: "Map 3", fioriColor: .preferredColor(.map3)),
        ColorEntity(name: "Map 4", fioriColor: .preferredColor(.map4)),
        ColorEntity(name: "Map 5", fioriColor: .preferredColor(.map5)),
        ColorEntity(name: "Map 6", fioriColor: .preferredColor(.map6)),
        ColorEntity(name: "Map 7", fioriColor: .preferredColor(.map7)),
        ColorEntity(name: "Map 8", fioriColor: .preferredColor(.map8)),
        ColorEntity(name: "Map 9", fioriColor: .preferredColor(.map9)),
        ColorEntity(name: "Map 10", fioriColor: .preferredColor(.map10))
    ]
    
    static func filterColors(_ queryString: String) -> [ColorEntity] {
        if queryString.isEmpty {
            return colors
        } else {
            return colors.filter { $0.name.localizedCaseInsensitiveContains(queryString) }
        }
    }

    static func filterColors(_ queryString: String, scope: SearchScope) -> [ColorEntity] {
        if queryString.isEmpty {
            switch scope {
            case .all:
                return colors
            case .basic:
                return colors.filter { !$0.name.localizedCaseInsensitiveContains("Tint Color") &&
                    !$0.name.localizedCaseInsensitiveContains("Chart ") &&
                    !$0.name.localizedCaseInsensitiveContains("Map ") }
                
            case .chart:
                return colors.filter { $0.name.localizedCaseInsensitiveContains("Chart ") }
            case .map:
                return colors.filter { $0.name.localizedCaseInsensitiveContains("Map ") }
            }
        } else {
            switch scope {
            case .all:
                return colors.filter { $0.name.localizedCaseInsensitiveContains(queryString) }
            case .basic:
                return colors.filter { $0.name.localizedCaseInsensitiveContains(queryString) &&
                    !$0.name.localizedCaseInsensitiveContains("Tint Color") &&
                    !$0.name.localizedCaseInsensitiveContains("Chart ") &&
                    !$0.name.localizedCaseInsensitiveContains("Map ") }
                
            case .chart:
                return colors.filter { $0.name.localizedCaseInsensitiveContains(queryString) &&
                    $0.name.localizedCaseInsensitiveContains("Chart ") }
            case .map:
                return colors.filter { $0.name.localizedCaseInsensitiveContains(queryString) &&
                    $0.name.localizedCaseInsensitiveContains("Map ") }
            }
        }
    }
    
    static func filterColors(_ queryString: String, tokens: [ColorToken]) -> [ColorEntity] {
        if tokens.isEmpty {
            if queryString.isEmpty {
                return colors
            } else {
                return colors.filter { $0.name.localizedCaseInsensitiveContains(queryString) }
            }
        } else {
            if queryString.isEmpty {
                return colors.filter { tokens.map { $0.name }.contains($0.name) }
            } else {
                return colors.filter { tokens.map { $0.name }.contains($0.name) || $0.name.contains(queryString) }
            }
        }
    }
}

struct ColorToken: Identifiable {
    let id = UUID().uuidString
    let name: String
    let fioriColor: Color
}

enum SearchScope: String, CaseIterable {
    case all, basic, chart, map
}

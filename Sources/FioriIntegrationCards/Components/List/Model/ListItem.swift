//
//  ListItem.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/20/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
import UIKit

struct ListItem: Decodable, RawBindable, Identifiable {
    let icon: Icon?
    let title: String?
    let description: String?
    let highlight: Highlight?
    
    var id: String {
        return _uuid.uuidString
    }
    private let _uuid: UUID = UUID()
    
    init(data: Dictionary<String, Any>, binding: ListItemBinding) {
        
        if let path = binding.icon?.src {
            icon = Icon(src: path.replacingPlaceholders(withValuesIn: data))
        } else {
            icon = nil
        }
        
        if let path = binding.title {
            title = path.replacingPlaceholders(withValuesIn: data)
        } else {
            title = nil
        }
        
        if let path = binding.description {
            description = path.replacingPlaceholders(withValuesIn: data)
        } else {
            description = nil
        }
        highlight = nil
//        if let path = binding.highlight {
//            let value = path.replacingPlaceholders(withValuesIn: data)
//            highlight = Highlight(rawValue: value) ?? Highlight.none
//        } else {
//            highlight = nil
//        }
    }
}

//
//  Action.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/20/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation

public struct Action: Decodable, Hashable {
    public let type: String?
    public let url: String?
}

extension Action: Placeholding {
    public func replacingPlaceholders(withValuesIn dictionary: Dictionary<String, Any>) -> Action {
        let _type = type?.replacingPlaceholders(withValuesIn: dictionary)
        let _url  = url?.replacingPlaceholders(withValuesIn: dictionary)
        return Action(type: _type, url: _url)
    }
}

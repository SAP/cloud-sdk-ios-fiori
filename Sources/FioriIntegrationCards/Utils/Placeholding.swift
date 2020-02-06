//
//  PlaceholderReplacing.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/23/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation

protocol Placeholding {
    func replacingPlaceholders(withValuesIn dictionary: Dictionary<String, Any>) -> Self
}

extension String: Placeholding {}


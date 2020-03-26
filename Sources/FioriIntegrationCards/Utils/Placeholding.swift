//
//  PlaceholderReplacing.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/23/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation

public protocol Placeholding {
    func replacingPlaceholders(withValuesIn object: Any) -> Self
    
}

//
//  RawBindable.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/20/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation

protocol RawBindable {
    associatedtype Binding: Decodable
    init(data: [String: Any], binding: Binding)
}

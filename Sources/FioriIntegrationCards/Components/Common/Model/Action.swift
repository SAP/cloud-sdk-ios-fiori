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

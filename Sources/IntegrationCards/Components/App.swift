//
//  App.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/22/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation


public struct App: Codable, Identifiable, Hashable {
    public let id: String
    public let type: String
    public let title: String?
    public let subTitle: String?
}

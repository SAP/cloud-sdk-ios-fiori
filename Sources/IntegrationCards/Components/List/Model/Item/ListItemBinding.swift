//
//  ListItemBinding.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/20/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation

struct ListItemBinding: Decodable {
    let icon: Icon?
    let title: String?
    let description: String?
    let action: [Action]?
    let highlight: String?
}

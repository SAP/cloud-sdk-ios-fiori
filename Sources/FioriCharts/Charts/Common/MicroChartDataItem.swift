//
//  MicroChartDataItem.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/11/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI

public struct MicroChartDataItem: Identifiable {
    public var value: CGFloat
    public var label: String?
    public var displayValue: String?
    public var color: HexColor
    public let id: UUID = UUID()
    
    init(value: CGFloat = 0, displayValue: String? = nil, label: String? = nil, color: HexColor? = nil) {
        self.value = value
        self.displayValue = displayValue
        self.label = label
        if let color = color {
            self.color = color
        } else {
            self.color = Palette.hexColor(for: .primary2)
        }
    }
}

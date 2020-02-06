//
//  MicroChartDataItem.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/11/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI

public struct MicroChartDataItem: Identifiable{
    public var value: CGFloat
    public let label: String?
    public let displayValue: String?
    public let color: Color!
    public let id: UUID = UUID()
    
    init(value: CGFloat = 0, displayValue: String? = nil, label: String? = nil, color: Color? = Color.black) {
        self.value = value
        self.displayValue = displayValue
        self.label = label
        self.color = color
    }
}

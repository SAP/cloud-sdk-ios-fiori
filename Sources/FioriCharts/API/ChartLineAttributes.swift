//
//  ChartLineAttributes.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/4/20.
//

import Foundation
import SwiftUI

/// Gridline properties for an Axis.
public class ChartGridlineAttributes : ObservableObject, Identifiable {
    public init(width: Double = 1, color: Color = Color.gray, dashPattern: (length: Int, gap: Int)? = nil, isHidden: Bool = false) {
        self.width = width
        self.color = color
        self.dashPattern = dashPattern
        self.isHidden = isHidden
    }

    @Published public var width: Double

    @Published public var color: Color

    @Published public var dashPattern: (length: Int, gap: Int)?
    
    @Published public var isHidden: Bool = false

//    internal var colorHasAlphaComponent: Bool = false
    
    public let id = UUID()
}


// Baseline properties for an Axis.
public class ChartBaselineAttributes : ChartGridlineAttributes {

    public init(width: Double = 2, color: Color = Color.gray, dashPattern: (length: Int, gap: Int)? = nil, isHidden: Bool = false, value: Double? = nil, position: Double? = nil, colorHasAlphaComponent: Bool = false) {
        self.value = value
        self.position = position
        
        super.init(width: width, color: color, dashPattern: dashPattern, isHidden: isHidden)
    }

    /// Baseline value or nil if no data has been assigned to the Chart.
    @Published public var value: Double?

    /// Baseline position or nil if no data has been assigned to the Chart.
    @Published public var position: Double?
}

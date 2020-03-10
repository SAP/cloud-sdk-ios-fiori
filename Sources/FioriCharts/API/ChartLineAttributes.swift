//
//  ChartLineAttributes.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/4/20.
//

import Foundation
import SwiftUI

//public protocol ChartLineAttributes : class {
//
//    /// Width of the line in points.
//    var width: Double {get set}
//
//    /// Color of the line.
//    var color: Color {get set}
//
//    /// Dash pattern for the line. Specifies the length of painted segments, and the gap between them.
//    var dashPattern: (length: Int, gap: Int)? {get set}
//
//    /// Indicates whether the lines should be displayed or not.
//    var isHidden: Bool {get set}
//}


/// Gridline properties for an Axis.
public class ChartGridlineAttributes : ObservableObject, Identifiable {
    public init(width: Double = 1, color: Color = Color.gray, dashPattern: (length: Int, gap: Int)? = nil, isHidden: Bool = false, colorHasAlphaComponent: Bool = false) {
        self.width = width
        self.color = color
        self.dashPattern = dashPattern
        self.isHidden = isHidden
        self.colorHasAlphaComponent = colorHasAlphaComponent
    }

    @Published public var width: Double

    @Published public var color: Color

    @Published public var dashPattern: (length: Int, gap: Int)?
    
    @Published public var isHidden: Bool = false

    internal var colorHasAlphaComponent: Bool = false
    
    public let id = UUID()
}


// Baseline properties for an Axis.
public class ChartBaselineAttributes : ChartGridlineAttributes {

    public init(width: Double = 2, color: Color = Color.gray, dashPattern: (length: Int, gap: Int)? = nil, isHidden: Bool = false, value: Double? = nil, position: Double? = nil, colorHasAlphaComponent: Bool = false) {
//        self.width = width
//        self.color = color
//        self.dashPattern = dashPattern
//        self.isHidden = isHidden
//        self.colorHasAlphaComponent = colorHasAlphaComponent
        self.value = value
        self.position = position
        
        super.init(width: width, color: color, dashPattern: dashPattern, isHidden: isHidden, colorHasAlphaComponent: colorHasAlphaComponent)
    }


//    @Published public var width: Double
//
//    @Published public var color: Color
//
//    @Published public var dashPattern: (length: Int, gap: Int)?
//
//    @Published public var isHidden: Bool

    /// Baseline value or nil if no data has been assigned to the Chart.
    @Published public var value: Double?

    /// Baseline position or nil if no data has been assigned to the Chart.
    @Published public var position: Double?
    
//    internal var colorHasAlphaComponent: Bool = false
//
//    public let id = UUID()
}

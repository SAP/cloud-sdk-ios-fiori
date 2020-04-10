//
//  ChartPointAttributes.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/9/20.
//

import Foundation
import SwiftUI

public class ChartPointAttributes: ObservableObject, Identifiable {
    /// Indicates if the point is hidden or visible.
    @Published public var isHidden: Bool = false
    
    /// Diameter of the point.
    @Published public var diameter: Double = 4
    
    /// Allowed gap between dots before they run into eachother and are hidden.
    @Published public var gap: Double = 2
    
    /// Stroke color for the point.
    @Published public var strokeColor: HexColor = Palette.hexColor(for: .primary2)
    
    /// Line width for the point's stroked path.
    //@Published public var lineWidth: Double  = 0
    
    public let id = UUID()
    
    public init(isHidden: Bool = false, diameter: Double = 4, strokeColor: HexColor = Palette.hexColor(for: .primary2), gap: Double = 2) {
        self._isHidden = Published(initialValue: isHidden)
        self._diameter = Published(initialValue: diameter)
        self._strokeColor = Published(initialValue: strokeColor)
        self._gap = Published(initialValue: gap)
    }
}

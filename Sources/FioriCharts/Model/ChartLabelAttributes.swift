//
//  ChartLabelAttributes.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/5/20.
//

import Foundation
import SwiftUI

public class ChartLabelAttributes: ObservableObject, Identifiable {
    
    /// Text color for the label.
    @Published public var color: HexColor
    
    /// Size of the label font in points.
    @Published public var fontSize: Double

    /// font weight
    // @Published public var fontWeight: Double = 1

    /// Specifies how far from the axis labels should be rendered.
    @Published public var offset: Double
    
    
    /// True when the associated label(s) should be hidden.
    @Published public var isHidden: Bool
    
    
    public let id = UUID()
    
    public init(color: HexColor = Palette.hexColor(for: .primary2),
                fontSize: Double = 12,
                offset: Double = 0,
                isHidden: Bool = false) {
        self._color = Published(initialValue: color)
        self._fontSize = Published(initialValue: fontSize)
        self._offset = Published(initialValue: offset)
        self._isHidden = Published(initialValue: isHidden)
    }
                
}

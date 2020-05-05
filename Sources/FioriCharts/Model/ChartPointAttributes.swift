//
//  ChartPointAttributes.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/9/20.
//

import Foundation
import SwiftUI

public class ChartPointAttributes: ObservableObject, Identifiable, NSCopying {
    
    /// Indicates if the point is hidden or visible.
    @Published public var isHidden: Bool = false
    
    /// Diameter of the point.
    @Published public var diameter: CGFloat = 4
    
    /// Allowed gap between dots before they run into eachother and are hidden.
    @Published public var gap: CGFloat = 2
    
    /// Stroke color for the point.
    @Published public var strokeColor: HexColor = Palette.hexColor(for: .primary2)
    
    /// Line width for the point's stroked path.
    //@Published public var lineWidth: CGFloat  = 0
    
    public let id = UUID()
    
    public init(isHidden: Bool = false,
                diameter: Double = 4,
                strokeColor: HexColor = Palette.hexColor(for: .primary2),
                gap: Double = 2) {
        self._isHidden = Published(initialValue: isHidden)
        self._diameter = Published(initialValue: CGFloat(diameter))
        self._strokeColor = Published(initialValue: strokeColor)
        self._gap = Published(initialValue: CGFloat(gap))
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        let copy = ChartPointAttributes(isHidden: self.isHidden,
                                        diameter: Double(self.diameter),
                                        strokeColor: self.strokeColor,
                                        gap: Double(self.gap))
        
        return copy
    }
}

extension ChartPointAttributes: CustomStringConvertible {
    public var description: String {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 2
        
        return """
{
    "ChartPointAttributes": {
        "diameter": \(nf.string(from: NSNumber(value: Double(diameter))) ?? ""),
        "strokeColor": \(String(describing: strokeColor)),
        "gap": \(nf.string(from: NSNumber(value: Double(gap))) ?? ""),
        "isHidden": \(isHidden)
    }
}
"""
    }
}

extension ChartPointAttributes: Equatable {
    public static func == (lhs: ChartPointAttributes, rhs: ChartPointAttributes) -> Bool {
        return lhs.isHidden == rhs.isHidden &&
            lhs.diameter == rhs.diameter &&
            lhs.strokeColor == rhs.strokeColor &&
            lhs.gap == rhs.gap
    }
}

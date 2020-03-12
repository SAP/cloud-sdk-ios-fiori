//
//  ChartLabelAttributes.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/5/20.
//

import Foundation
import SwiftUI

public class ChartLabelAttributes: ObservableObject, Identifiable {
    /// Size of the label font in points.
    @Published public var fontSize: Double = 12

    /// font weight
    // @Published public var fontWeight: Double = 1

    /// Text color for the label.
    @Published public var color: String = "000000"

    /// True when the associated label(s) should be hidden.
    @Published public var isHidden: Bool = false

    /// Specifies how far from the axis labels should be rendered.
    @Published public var offset: Double = 0
    
    public let id = UUID()
}

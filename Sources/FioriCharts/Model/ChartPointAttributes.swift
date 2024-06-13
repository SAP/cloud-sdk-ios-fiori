import Foundation
import SwiftUI
import FioriThemeManager
import Combine

public class ChartPointAttributes: ObservableObject, Identifiable, NSCopying {
    /// Indicates if the point is hidden or visible.
    @Published public var isHidden: Bool = false
    
    /// Diameter of the point.
    @PublishedConstrainedValue(0 ... 100) public var diameter: CGFloat = 7
    
    /// Allowed gap between dots before they run into eachother and are hidden.
    @PublishedConstrainedValue(0 ... 100) public var gap: CGFloat = 2
    
    /// Stroke color for the point.
    @Published public var strokeColor: Color = .preferredColor(.secondaryLabel)
    
    /// Line width for the point's stroked path.
    // @Published public var lineWidth: CGFloat  = 0
    
    public let id = UUID()
    
    public init(isHidden: Bool = false,
                diameter: Double = 7,
                strokeColor: Color = .preferredColor(.secondaryLabel),
                gap: Double = 2)
    {
        self._isHidden = Published(initialValue: isHidden)
        self._diameter = PublishedConstrainedValue(wrappedValue: CGFloat(diameter), 0 ... 100)
        self._strokeColor = Published(initialValue: strokeColor)
        self._gap = PublishedConstrainedValue(wrappedValue: CGFloat(gap), 0 ... 100)
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
        nf.numberStyle = .none
        nf.maximumFractionDigits = 2
        
        return """
        {
            "ChartPointAttributes": {
                "diameter": \(nf.string(from: NSNumber(value: Double(self.diameter))) ?? ""),
                "strokeColor": \(String(describing: self.strokeColor)),
                "gap": \(nf.string(from: NSNumber(value: Double(self.gap))) ?? ""),
                "isHidden": \(self.isHidden)
            }
        }
        """
    }
}

extension ChartPointAttributes: Equatable {
    public static func == (lhs: ChartPointAttributes, rhs: ChartPointAttributes) -> Bool {
        lhs.isHidden == rhs.isHidden &&
            lhs.diameter == rhs.diameter &&
            lhs.strokeColor == rhs.strokeColor &&
            lhs.gap == rhs.gap
    }
}

extension ChartPointAttributes: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.strokeColor)
    }
}

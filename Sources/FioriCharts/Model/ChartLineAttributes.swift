import Foundation
import SwiftUI

/// Gridline properties for an Axis.
public class ChartGridlineAttributes: ObservableObject, Identifiable, NSCopying, CustomStringConvertible {
    public init(width: Double = 1,
                color: Color = .preferredColor(.primary4),
                dashPatternLength: Double = 1,
                dashPatternGap: Double = 3,
                isHidden: Bool = false)
    {
        self._width = PublishedConstrainedValue(wrappedValue: CGFloat(width), 0 ... 20)
        self._color = Published(initialValue: color)
        self._dashPatternLength = PublishedConstrainedValue(wrappedValue: CGFloat(dashPatternLength), 0 ... 20)
        self._dashPatternGap = PublishedConstrainedValue(wrappedValue: CGFloat(dashPatternGap), 0 ... 20)
        self._isHidden = Published(initialValue: isHidden)
    }

    public func copy(with zone: NSZone? = nil) -> Any {
        ChartGridlineAttributes(width: Double(self.width),
                                color: self.color,
                                dashPatternLength: Double(self.dashPatternLength),
                                dashPatternGap: Double(self.dashPatternGap),
                                isHidden: self.isHidden)
    }
    
    public var description: String {
        let nf = NumberFormatter()
        nf.numberStyle = .none
        nf.maximumFractionDigits = 2
        
        return """
        {
            "ChartGridlineAttributes": {
                "width": \(nf.string(from: NSNumber(value: Double(self.width))) ?? "nil"),
                "color": \(String(describing: self.color)),
                "dashPatternLength": \(nf.string(from: NSNumber(value: Double(self.dashPatternLength))) ?? "nil"),
                "dashPatternGap": \(nf.string(from: NSNumber(value: Double(self.dashPatternGap))) ?? "nil"),
                "isHidden": \(self.isHidden)
            }
        }
        """
    }
    
    @PublishedConstrainedValue(0 ... 20) public var width: CGFloat = 1
    @Published public var color: Color

    @PublishedConstrainedValue(0 ... 20) public var dashPatternLength: CGFloat = 1
    @PublishedConstrainedValue(0 ... 20) public var dashPatternGap: CGFloat = 0
    @Published public var isHidden: Bool
    
    public let id = UUID()
}

// Baseline properties for an Axis.
public class ChartBaselineAttributes: ChartGridlineAttributes {
    public init(width: Double = 1,
                color: Color = .preferredColor(.primary4),
                dashPatternLength: Double = 1,
                dashPatternGap: Double = 0,
                isHidden: Bool = false,
                value: Double? = nil,
                position: Double? = nil)
    {
        self._value = Published(initialValue: ChartUtility.cgfloatOptional(from: value))
        self._position = Published(initialValue: ChartUtility.cgfloatOptional(from: position))
        
        super.init(width: width, color: color, dashPatternLength: dashPatternLength, dashPatternGap: dashPatternGap, isHidden: isHidden)
    }
    
    override public func copy(with zone: NSZone? = nil) -> Any {
        ChartBaselineAttributes(width: Double(self.width),
                                color: self.color,
                                dashPatternLength: Double(self.dashPatternLength),
                                dashPatternGap: Double(self.dashPatternGap),
                                isHidden: self.isHidden,
                                value: ChartUtility.doubleOptional(from: self.value),
                                position: ChartUtility.doubleOptional(from: self.position))
    }

    override public var description: String {
        let nf = NumberFormatter()
        nf.numberStyle = .none
        nf.maximumFractionDigits = 2
        
        return """
        {
            "ChartBaselineAttributes": {
                "width": \(nf.string(from: NSNumber(value: Double(width))) ?? "nil"),
                "color": \(String(describing: color)),
                "dashPatternLength": \(nf.string(from: NSNumber(value: Double(dashPatternLength))) ?? "nil"),
                "dashPatternGap": \(nf.string(from: NSNumber(value: Double(dashPatternGap))) ?? "nil"),
                "isHidden": \(isHidden),
                "value": "\(String(describing: self.value))",
                "position": "\(String(describing: self.position))"
            }
        }
        """
    }
    
    /// Baseline value or nil if no data has been assigned to the Chart.
    @Published public var value: CGFloat?

    /// Baseline position or nil if no data has been assigned to the Chart.
    @Published public var position: CGFloat?
}

extension ChartGridlineAttributes: Equatable {
    public static func == (lhs: ChartGridlineAttributes, rhs: ChartGridlineAttributes) -> Bool {
        lhs.width == rhs.width &&
            lhs.color == rhs.color &&
            lhs.dashPatternLength == rhs.dashPatternLength &&
            lhs.dashPatternGap == rhs.dashPatternGap &&
            lhs.isHidden == rhs.isHidden
    }
}

public extension ChartBaselineAttributes {
    /// conform to Equatable
    static func == (lhs: ChartBaselineAttributes, rhs: ChartBaselineAttributes) -> Bool {
        lhs.width == rhs.width &&
            lhs.color == rhs.color &&
            lhs.dashPatternLength == rhs.dashPatternLength &&
            lhs.dashPatternGap == rhs.dashPatternGap &&
            lhs.isHidden == rhs.isHidden &&
            lhs.value == rhs.value &&
            lhs.position == rhs.position
    }
}

import Foundation
import SwiftUI

public class ChartLabelAttributes: ObservableObject, Identifiable, NSCopying {
    /// Text color for the label.
    @Published public var color: Color
    
    /// Size of the label font in points.
    @PublishedConstrainedValue(0 ... 100) public var fontSize: CGFloat = 12

    /// font weight
    // @Published public var fontWeight: CGFloat = 1

    /// Specifies how far from the axis labels should be rendered.
    @PublishedConstrainedValue(-10 ... 10) public var offset: CGFloat = 0
    
    /// True when the associated label(s) should be hidden.
    @Published public var isHidden: Bool
    
    public let id = UUID()
    
    public init(color: Color = .preferredColor(.primary3),
                fontSize: Double = 12,
                offset: Double = 0,
                isHidden: Bool = false)
    {
        self._color = Published(initialValue: color)
        self._fontSize = PublishedConstrainedValue(wrappedValue: CGFloat(fontSize), 0 ... 100)
        self._offset = PublishedConstrainedValue(wrappedValue: CGFloat(offset), -10 ... 10)
        self._isHidden = Published(initialValue: isHidden)
    }
        
    public func copy(with zone: NSZone? = nil) -> Any {
        ChartLabelAttributes(color: self.color,
                             fontSize: Double(self.fontSize),
                             offset: Double(self.offset),
                             isHidden: self.isHidden)
    }
}

extension ChartLabelAttributes: Equatable {
    public static func == (lhs: ChartLabelAttributes, rhs: ChartLabelAttributes) -> Bool {
        lhs.color == rhs.color &&
            lhs.fontSize == rhs.fontSize &&
            lhs.offset == rhs.offset &&
            lhs.isHidden == rhs.isHidden
    }
}

extension ChartLabelAttributes: CustomStringConvertible {
    public var description: String {
        let nf = NumberFormatter()
        nf.numberStyle = .none
        nf.maximumFractionDigits = 2
    
        return """
        {
            "ChartLabelAttributes": {
                "color": \(String(describing: self.color)),
                "fontSize": \(nf.string(from: NSNumber(value: Double(self.fontSize))) ?? "nil"),
                "offset": \(nf.string(from: NSNumber(value: Double(self.offset))) ?? "nil"),
                "isHidden": \(self.isHidden)
            }
        }
        """
    }
}

import Combine
import FioriThemeManager
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
    
    /// Font for the label, has higher priority than fontSize.
    @Published public var font: Font?
    /// Backgroundcolor for the label.
    @Published public var backgroundColor: Color?
    
    /// When font not be configured, use .fiori(fixedSize: fontSize) as default;
    var targetFont: Font {
        if let font {
            return font
        } else {
            return .fiori(fixedSize: self.fontSize)
        }
    }
    
    public let id = UUID()
    
    /// The constructor with color, fontSize, offset, isHidden and backgroundColor
    public init(color: Color = .preferredColor(.tertiaryLabel),
                fontSize: Double = 12,
                offset: Double = 0,
                isHidden: Bool = false,
                backgroundColor: Color? = nil)
    {
        self._color = Published(initialValue: color)
        self._fontSize = PublishedConstrainedValue(wrappedValue: CGFloat(fontSize), 0 ... 100)
        self._offset = PublishedConstrainedValue(wrappedValue: CGFloat(offset), -10 ... 10)
        self._isHidden = Published(initialValue: isHidden)
        self._backgroundColor = Published(initialValue: backgroundColor)
    }
    
    /// The constructor with color, font, offset, isHidden and backgroundColor
    public init(color: Color = .preferredColor(.tertiaryLabel),
                font: Font?,
                offset: Double = 0,
                isHidden: Bool = false,
                backgroundColor: Color? = nil)
    {
        self._color = Published(initialValue: color)
        self._font = Published(initialValue: font)
        self._offset = PublishedConstrainedValue(wrappedValue: CGFloat(offset), -10 ... 10)
        self._isHidden = Published(initialValue: isHidden)
        self._backgroundColor = Published(initialValue: backgroundColor)
    }
        
    public func copy(with zone: NSZone? = nil) -> Any {
        let chartLabelAttributes = ChartLabelAttributes(color: self.color,
                                                        fontSize: Double(self.fontSize),
                                                        offset: Double(self.offset),
                                                        isHidden: self.isHidden,
                                                        backgroundColor: self.backgroundColor)
        // assign font property
        chartLabelAttributes.font = self.font
        return chartLabelAttributes
    }
}

extension ChartLabelAttributes: Equatable {
    public static func == (lhs: ChartLabelAttributes, rhs: ChartLabelAttributes) -> Bool {
        lhs.color == rhs.color &&
            lhs.fontSize == rhs.fontSize &&
            lhs.offset == rhs.offset &&
            lhs.isHidden == rhs.isHidden &&
            lhs.font == rhs.font &&
            lhs.backgroundColor == rhs.backgroundColor
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

import FioriSwiftUICore
import Foundation
import SwiftUI

struct MicroChartDataItem: Identifiable {
    public var value: CGFloat
    public var label: String?
    public var displayValue: String?
    public var color: Color
    public let id = UUID()
    
    init(value: CGFloat = 0, displayValue: String? = nil, label: String? = nil, color: Color? = nil) {
        self.value = value
        self.displayValue = displayValue
        self.label = label
        if let color = color {
            self.color = color
        } else {
            self.color = .preferredColor(.primary2)
        }
    }
}

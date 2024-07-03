import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimestampLabelBaseStyle: TimestampLabelStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TimestampLabelConfiguration) -> some View {
        configuration.timestampLabel
    }
}

// Default fiori styles
public struct TimestampLabelFioriStyle: TimestampLabelStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TimestampLabelConfiguration) -> some View {
        TimestampLabel(configuration)
    }
}

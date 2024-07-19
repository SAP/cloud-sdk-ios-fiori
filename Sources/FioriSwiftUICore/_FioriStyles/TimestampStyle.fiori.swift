import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimestampBaseStyle: TimestampStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TimestampConfiguration) -> some View {
        configuration.timestamp
    }
}

// Default fiori styles
public struct TimestampFioriStyle: TimestampStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TimestampConfiguration) -> some View {
        Timestamp(configuration)
    }
}

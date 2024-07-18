import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SecondaryTimestampBaseStyle: SecondaryTimestampStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SecondaryTimestampConfiguration) -> some View {
        configuration.secondaryTimestamp
    }
}

// Default fiori styles
public struct SecondaryTimestampFioriStyle: SecondaryTimestampStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SecondaryTimestampConfiguration) -> some View {
        SecondaryTimestamp(configuration)
    }
}

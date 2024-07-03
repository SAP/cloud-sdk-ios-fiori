import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SecondaryTimestampLabelBaseStyle: SecondaryTimestampLabelStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SecondaryTimestampLabelConfiguration) -> some View {
        configuration.secondaryTimestampLabel
    }
}

// Default fiori styles
public struct SecondaryTimestampLabelFioriStyle: SecondaryTimestampLabelStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SecondaryTimestampLabelConfiguration) -> some View {
        SecondaryTimestampLabel(configuration)
    }
}

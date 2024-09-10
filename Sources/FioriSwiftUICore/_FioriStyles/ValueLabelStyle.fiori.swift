import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ValueLabelBaseStyle: ValueLabelStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
        configuration.valueLabel
    }
}

// Default fiori styles
public struct ValueLabelFioriStyle: ValueLabelStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
        ValueLabel(configuration)
    }
}

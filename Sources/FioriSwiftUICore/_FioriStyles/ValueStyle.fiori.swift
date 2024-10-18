import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ValueBaseStyle: ValueStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ValueConfiguration) -> some View {
        configuration.value
    }
}

// Default fiori styles
public struct ValueFioriStyle: ValueStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ValueConfiguration) -> some View {
        Value(configuration)
    }
}

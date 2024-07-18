import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttributeBaseStyle: AttributeStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttributeConfiguration) -> some View {
        configuration.attribute
    }
}

// Default fiori styles
public struct AttributeFioriStyle: AttributeStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttributeConfiguration) -> some View {
        Attribute(configuration)
    }
}

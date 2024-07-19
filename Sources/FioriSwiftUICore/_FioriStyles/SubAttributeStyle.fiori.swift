import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SubAttributeBaseStyle: SubAttributeStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SubAttributeConfiguration) -> some View {
        configuration.subAttribute
    }
}

// Default fiori styles
public struct SubAttributeFioriStyle: SubAttributeStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SubAttributeConfiguration) -> some View {
        SubAttribute(configuration)
    }
}

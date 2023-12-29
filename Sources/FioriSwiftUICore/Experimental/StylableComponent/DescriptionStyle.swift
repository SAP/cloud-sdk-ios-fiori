import FioriMacro
import FioriThemeManager
import Foundation
import SwiftUI

@ComponentStyle
public protocol DescriptionStyle: DynamicProperty {}

public extension DescriptionStyle where Self == DescriptionBaseStyle {
    static var base: DescriptionBaseStyle {
        DescriptionBaseStyle()
    }
}

public extension DescriptionStyle where Self == DescriptionFioriStyle {
    static var fiori: DescriptionFioriStyle {
        DescriptionFioriStyle()
    }
}

// MARK: SDK Developer implementations

// Base Layout style
public struct DescriptionBaseStyle: DescriptionStyle {
    public func makeBody(_ configuration: DescriptionConfiguration) -> some View {
        configuration.description
    }
}

// Default fiori styles
public struct DescriptionFioriStyle: DescriptionStyle {
    public func makeBody(_ configuration: DescriptionConfiguration) -> some View {
        Description(configuration)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .font(.subheadline)
    }
}

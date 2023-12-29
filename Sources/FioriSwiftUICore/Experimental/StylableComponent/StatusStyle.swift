import FioriMacro
import FioriThemeManager
import Foundation
import SwiftUI

@ComponentStyle
public protocol StatusStyle: DynamicProperty {}

public extension StatusStyle where Self == StatusBaseStyle {
    static var base: StatusBaseStyle {
        StatusBaseStyle()
    }
}

public extension StatusStyle where Self == StatusFioriStyle {
    static var fiori: StatusFioriStyle {
        StatusFioriStyle()
    }
}

// MARK: SDK Developer implementations

// Base Layout style
public struct StatusBaseStyle: StatusStyle {
    public func makeBody(_ configuration: StatusConfiguration) -> some View {
        configuration.status
    }
}

// Default fiori styles
public struct StatusFioriStyle: StatusStyle {
    public func makeBody(_ configuration: StatusConfiguration) -> some View {
        Status(configuration)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .font(.subheadline)
    }
}

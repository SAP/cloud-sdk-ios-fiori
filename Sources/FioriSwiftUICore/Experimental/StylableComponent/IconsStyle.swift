import FioriMacro
import FioriThemeManager
import Foundation
import SwiftUI

@ComponentStyle
public protocol IconsStyle: DynamicProperty {}

public extension IconsStyle where Self == IconsBaseStyle {
    static var base: IconsBaseStyle {
        IconsBaseStyle()
    }
}

public extension IconsStyle where Self == IconsFioriStyle {
    static var fiori: IconsFioriStyle {
        IconsFioriStyle()
    }
}

// MARK: SDK Developer implementations

// Base Layout style
public struct IconsBaseStyle: IconsStyle {
    public func makeBody(_ configuration: IconsConfiguration) -> some View {
        configuration.icons
    }
}

// Default fiori styles
public struct IconsFioriStyle: IconsStyle {
    public func makeBody(_ configuration: IconsConfiguration) -> some View {
        Icons(configuration)
    }
}

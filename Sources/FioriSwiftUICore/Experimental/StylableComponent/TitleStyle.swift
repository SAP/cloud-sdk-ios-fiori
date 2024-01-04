import FioriMacro
import FioriThemeManager
import Foundation
import SwiftUI

// MARK: Macro generated

@ComponentStyle
public protocol TitleStyle: DynamicProperty {}

public extension TitleStyle where Self == TitleBaseStyle {
    static var base: TitleBaseStyle {
        TitleBaseStyle()
    }
}

public extension TitleStyle where Self == TitleFioriStyle {
    static var fiori: TitleFioriStyle {
        TitleFioriStyle()
    }
}

// MARK: SDK Developer implementations

// Base Layout style
public struct TitleBaseStyle: TitleStyle {
    public func makeBody(_ configuration: TitleConfiguration) -> some View {
        configuration.title
    }
}

// Default fiori styles
public struct TitleFioriStyle: TitleStyle {
    public func makeBody(_ configuration: TitleConfiguration) -> some View {
        Title(configuration)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .font(.fiori(forTextStyle: .headline))
    }
}

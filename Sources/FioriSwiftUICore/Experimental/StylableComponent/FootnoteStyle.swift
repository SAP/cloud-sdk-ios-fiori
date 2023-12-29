import FioriMacro
import FioriThemeManager
import Foundation
import SwiftUI

@ComponentStyle
public protocol FootnoteStyle: DynamicProperty {}

public extension FootnoteStyle where Self == FootnoteBaseStyle {
    static var base: FootnoteBaseStyle {
        FootnoteBaseStyle()
    }
}

public extension FootnoteStyle where Self == FootnoteFioriStyle {
    static var fiori: FootnoteFioriStyle {
        FootnoteFioriStyle()
    }
}

// MARK: SDK Developer implementations

// Base Layout style
public struct FootnoteBaseStyle: FootnoteStyle {
    public func makeBody(_ configuration: FootnoteConfiguration) -> some View {
        configuration.footnote
    }
}

// Default fiori styles
public struct FootnoteFioriStyle: FootnoteStyle {
    public func makeBody(_ configuration: FootnoteConfiguration) -> some View {
        Footnote(configuration)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .font(.subheadline)
    }
}

import FioriThemeManager
// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol FootnoteIconsStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: FootnoteIconsConfiguration) -> Body
}

struct AnyFootnoteIconsStyle: FootnoteIconsStyle {
    let content: (FootnoteIconsConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (FootnoteIconsConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: FootnoteIconsConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct FootnoteIconsConfiguration {
    public let footnoteIcons: FootnoteIcons
	
    public typealias FootnoteIcons = ConfigurationViewWrapper
}

// MARK: SDK Developer implementations

// Base Layout style
public struct FootnoteIconsBaseStyle: FootnoteIconsStyle {
    public func makeBody(_ configuration: FootnoteIconsConfiguration) -> some View {
        configuration.footnoteIcons
    }
}

// Default fiori styles
public struct FootnoteIconsFioriStyle: FootnoteIconsStyle {
    public func makeBody(_ configuration: FootnoteIconsConfiguration) -> some View {
        FootnoteIcons(configuration)
    }
}

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol FootnoteIconsTextStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: FootnoteIconsTextConfiguration) -> Body
}

struct AnyFootnoteIconsTextStyle: FootnoteIconsTextStyle {
    let content: (FootnoteIconsTextConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (FootnoteIconsTextConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: FootnoteIconsTextConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct FootnoteIconsTextConfiguration {
    public let footnoteIconsTextIdentifier = "FioriFootnoteIconsText_footnoteIconsText"

    public let footnoteIconsText: FootnoteIconsText

    public typealias FootnoteIconsText = ConfigurationViewWrapper
}

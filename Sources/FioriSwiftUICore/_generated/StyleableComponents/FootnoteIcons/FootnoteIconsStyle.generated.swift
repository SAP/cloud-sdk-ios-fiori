// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol FootnoteIconsStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: FootnoteIconsConfiguration) -> Body
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
    public var componentIdentifier: String = "fiori_footnoteicons_component"
    public let footnoteIcons: FootnoteIcons

    public typealias FootnoteIcons = ConfigurationViewWrapper
}

extension FootnoteIconsConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct FootnoteIconsDefaultStyle: FootnoteIconsStyle {
    nonisolated init() {}

    func makeBody(_ configuration: FootnoteIconsConfiguration) -> some View {
        FootnoteIcons(configuration)
            .footnoteIconsStyle(FootnoteIconsBaseStyle())
    }
}

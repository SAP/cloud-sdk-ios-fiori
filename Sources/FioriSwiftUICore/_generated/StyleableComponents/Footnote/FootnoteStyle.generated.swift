// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol FootnoteStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: FootnoteConfiguration) -> Body
}

struct AnyFootnoteStyle: FootnoteStyle {
    let content: (FootnoteConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (FootnoteConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: FootnoteConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct FootnoteConfiguration {
    public var componentIdentifier: String = "fiori_footnote_component"
    public let footnote: Footnote

    public typealias Footnote = ConfigurationViewWrapper
}

extension FootnoteConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

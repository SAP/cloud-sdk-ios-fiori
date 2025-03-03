// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AttachmentFootnoteStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AttachmentFootnoteConfiguration) -> Body
}

struct AnyAttachmentFootnoteStyle: AttachmentFootnoteStyle {
    let content: (AttachmentFootnoteConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AttachmentFootnoteConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AttachmentFootnoteConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AttachmentFootnoteConfiguration {
    public let footnote: Footnote

    public typealias Footnote = ConfigurationViewWrapper
}

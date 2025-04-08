// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AttachmentStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AttachmentConfiguration) -> Body
}

struct AnyAttachmentStyle: AttachmentStyle {
    let content: (AttachmentConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AttachmentConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AttachmentConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AttachmentConfiguration {
    public var componentIdentifier: String = "fiori_attachment_component"
    public let attachmentTitle: AttachmentTitle
    public let attachmentSubtitle: AttachmentSubtitle
    public let attachmentFootnote: AttachmentFootnote
    public let url: URL
    public let controlState: ControlState

    public typealias AttachmentTitle = ConfigurationViewWrapper
    public typealias AttachmentSubtitle = ConfigurationViewWrapper
    public typealias AttachmentFootnote = ConfigurationViewWrapper
}

extension AttachmentConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct AttachmentFioriStyle: AttachmentStyle {
    public func makeBody(_ configuration: AttachmentConfiguration) -> some View {
        Attachment(configuration)
            .attachmentTitleStyle(AttachmentTitleFioriStyle(attachmentConfiguration: configuration))
            .attachmentSubtitleStyle(AttachmentSubtitleFioriStyle(attachmentConfiguration: configuration))
            .attachmentFootnoteStyle(AttachmentFootnoteFioriStyle(attachmentConfiguration: configuration))
    }
}

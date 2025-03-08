// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AttachmentSubtitleStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AttachmentSubtitleConfiguration) -> Body
}

struct AnyAttachmentSubtitleStyle: AttachmentSubtitleStyle {
    let content: (AttachmentSubtitleConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AttachmentSubtitleConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AttachmentSubtitleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AttachmentSubtitleConfiguration {
    public var componentIdentifier: String = "fiori_attachmentsubtitle_component"
    public let attachmentSubtitle: AttachmentSubtitle

    public typealias AttachmentSubtitle = ConfigurationViewWrapper
}

extension AttachmentSubtitleConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

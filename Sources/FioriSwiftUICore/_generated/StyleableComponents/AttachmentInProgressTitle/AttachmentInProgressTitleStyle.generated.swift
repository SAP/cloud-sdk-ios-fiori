// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AttachmentInProgressTitleStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AttachmentInProgressTitleConfiguration) -> Body
}

struct AnyAttachmentInProgressTitleStyle: AttachmentInProgressTitleStyle {
    let content: (AttachmentInProgressTitleConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AttachmentInProgressTitleConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AttachmentInProgressTitleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AttachmentInProgressTitleConfiguration {
    public var componentIdentifier: String = "fiori_attachmentinprogresstitle_component"
    public let attachmentInProgressTitle: AttachmentInProgressTitle

    public typealias AttachmentInProgressTitle = ConfigurationViewWrapper
}

extension AttachmentInProgressTitleConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

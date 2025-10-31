// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AttachmentErrorTitleStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AttachmentErrorTitleConfiguration) -> Body
}

struct AnyAttachmentErrorTitleStyle: AttachmentErrorTitleStyle {
    let content: (AttachmentErrorTitleConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AttachmentErrorTitleConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AttachmentErrorTitleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AttachmentErrorTitleConfiguration {
    public var componentIdentifier: String = "fiori_attachmenterrortitle_component"
    public let attachmentErrorTitle: AttachmentErrorTitle

    public typealias AttachmentErrorTitle = ConfigurationViewWrapper
}

extension AttachmentErrorTitleConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

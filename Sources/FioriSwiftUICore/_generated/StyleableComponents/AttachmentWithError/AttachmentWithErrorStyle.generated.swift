// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AttachmentWithErrorStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AttachmentWithErrorConfiguration) -> Body
}

struct AnyAttachmentWithErrorStyle: AttachmentWithErrorStyle {
    let content: (AttachmentWithErrorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AttachmentWithErrorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AttachmentWithErrorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AttachmentWithErrorConfiguration {
    public var componentIdentifier: String = "fiori_attachmentwitherror_component"
    public let attachmentErrorTitle: AttachmentErrorTitle
    public let attachmentInfo: AttachmentInfo
    public let onPreview: ((AttachmentInfo) -> Void)?
    public let onDelete: ((AttachmentInfo) -> Void)?

    public typealias AttachmentErrorTitle = ConfigurationViewWrapper
}

extension AttachmentWithErrorConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct AttachmentWithErrorFioriStyle: AttachmentWithErrorStyle {
    public func makeBody(_ configuration: AttachmentWithErrorConfiguration) -> some View {
        AttachmentWithError(configuration)
            .attachmentErrorTitleStyle(AttachmentErrorTitleFioriStyle(attachmentWithErrorConfiguration: configuration))
    }
}

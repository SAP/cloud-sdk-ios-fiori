// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AttachmentInProgressStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AttachmentInProgressConfiguration) -> Body
}

struct AnyAttachmentInProgressStyle: AttachmentInProgressStyle {
    let content: (AttachmentInProgressConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AttachmentInProgressConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AttachmentInProgressConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AttachmentInProgressConfiguration {
    public var componentIdentifier: String = "fiori_attachmentinprogress_component"
    public let attachmentInProgressTitle: AttachmentInProgressTitle
    public let attachmentInfo: AttachmentInfo
    public let onPreview: ((AttachmentInfo) -> Void)?
    public let onDelete: ((AttachmentInfo) -> Void)?

    public typealias AttachmentInProgressTitle = ConfigurationViewWrapper
}

extension AttachmentInProgressConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct AttachmentInProgressFioriStyle: AttachmentInProgressStyle {
    public func makeBody(_ configuration: AttachmentInProgressConfiguration) -> some View {
        AttachmentInProgress(configuration)
            .attachmentInProgressTitleStyle(AttachmentInProgressTitleFioriStyle(attachmentInProgressConfiguration: configuration))
    }
}

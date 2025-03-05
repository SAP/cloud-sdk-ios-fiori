// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AttachmentGroupStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AttachmentGroupConfiguration) -> Body
}

struct AnyAttachmentGroupStyle: AttachmentGroupStyle {
    let content: (AttachmentGroupConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AttachmentGroupConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AttachmentGroupConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AttachmentGroupConfiguration {
    public var componentIdentifier: String = "fiori_attachmentgroup_component"
    public let title: Title
    @Binding public var attachments: [URL]
    public let maxCount: Int?
    public let processor: AttachmentProcessor
    public let controlState: ControlState
    @Binding public var errorMessage: AttributedString?
    public let operations: Operations
    public let onPreview: ((URL) -> Void)?

    public typealias Title = ConfigurationViewWrapper
    public typealias Operations = ConfigurationViewWrapper
}

extension AttachmentGroupConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct AttachmentGroupFioriStyle: AttachmentGroupStyle {
    public func makeBody(_ configuration: AttachmentGroupConfiguration) -> some View {
        AttachmentGroup(configuration)
            .titleStyle(TitleFioriStyle(attachmentGroupConfiguration: configuration))
    }
}

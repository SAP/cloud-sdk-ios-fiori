// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol AttachmentTitleStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: AttachmentTitleConfiguration) -> Body
}

struct AnyAttachmentTitleStyle: AttachmentTitleStyle {
    let content: (AttachmentTitleConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AttachmentTitleConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AttachmentTitleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AttachmentTitleConfiguration {
    public var componentIdentifier: String = "fiori_attachmenttitle_component"
    public let attachmentTitle: AttachmentTitle

    public typealias AttachmentTitle = ConfigurationViewWrapper
}

extension AttachmentTitleConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct AttachmentTitleDefaultStyle: AttachmentTitleStyle {
    nonisolated init() {}

    func makeBody(_ configuration: AttachmentTitleConfiguration) -> some View {
        AttachmentTitle(configuration)
            .attachmentTitleStyle(AttachmentTitleBaseStyle())
    }
}

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AttachmentThumbnailStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AttachmentThumbnailConfiguration) -> Body
}

struct AnyAttachmentThumbnailStyle: AttachmentThumbnailStyle {
    let content: (AttachmentThumbnailConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AttachmentThumbnailConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AttachmentThumbnailConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AttachmentThumbnailConfiguration {
    public var componentIdentifier: String = "fiori_attachmentthumbnail_component"
    public let url: URL
    public let controlState: ControlState
}

extension AttachmentThumbnailConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct AttachmentThumbnailFioriStyle: AttachmentThumbnailStyle {
    public func makeBody(_ configuration: AttachmentThumbnailConfiguration) -> some View {
        AttachmentThumbnail(configuration)
    }
}

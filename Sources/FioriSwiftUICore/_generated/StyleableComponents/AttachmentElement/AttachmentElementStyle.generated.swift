// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AttachmentElementStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AttachmentElementConfiguration) -> Body
}

struct AnyAttachmentElementStyle: AttachmentElementStyle {
    let content: (AttachmentElementConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AttachmentElementConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AttachmentElementConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AttachmentElementConfiguration {
    public var componentIdentifier: String = "fiori_attachmentelement_component"
    public let attachmentInfo: AttachmentInfo
    public let controlState: ControlState
    public let onExtraInfoChange: ((any AttachmentExtraInfo) -> Void)?
    public let onPreview: ((AttachmentInfo) -> Void)?
    public let onDelete: ((AttachmentInfo) -> Void)?
}

extension AttachmentElementConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct AttachmentElementFioriStyle: AttachmentElementStyle {
    public func makeBody(_ configuration: AttachmentElementConfiguration) -> some View {
        AttachmentElement(configuration)
    }
}

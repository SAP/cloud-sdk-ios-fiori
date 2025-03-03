// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AttachmentButtonImageStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AttachmentButtonImageConfiguration) -> Body
}

struct AnyAttachmentButtonImageStyle: AttachmentButtonImageStyle {
    let content: (AttachmentButtonImageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AttachmentButtonImageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AttachmentButtonImageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AttachmentButtonImageConfiguration {
    public let addButtonImage: AddButtonImage
    public let controlState: ControlState

    public typealias AddButtonImage = ConfigurationViewWrapper
}

public struct AttachmentButtonImageFioriStyle: AttachmentButtonImageStyle {
    public func makeBody(_ configuration: AttachmentButtonImageConfiguration) -> some View {
        AttachmentButtonImage(configuration)
    }
}

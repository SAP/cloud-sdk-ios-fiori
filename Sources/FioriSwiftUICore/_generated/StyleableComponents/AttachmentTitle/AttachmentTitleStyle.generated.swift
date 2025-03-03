// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AttachmentTitleStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AttachmentTitleConfiguration) -> Body
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
    public let title: Title

    public typealias Title = ConfigurationViewWrapper
}

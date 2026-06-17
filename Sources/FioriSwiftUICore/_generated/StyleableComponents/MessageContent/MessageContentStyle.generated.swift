// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol MessageContentStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: MessageContentConfiguration) -> Body
}

struct AnyMessageContentStyle: MessageContentStyle {
    let content: (MessageContentConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (MessageContentConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: MessageContentConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct MessageContentConfiguration {
    public var componentIdentifier: String = "fiori_messagecontent_component"
    public let messageContent: MessageContent

    public typealias MessageContent = ConfigurationViewWrapper
}

extension MessageContentConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

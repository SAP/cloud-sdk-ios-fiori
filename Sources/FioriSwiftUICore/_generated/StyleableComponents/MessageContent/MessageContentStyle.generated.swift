// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol MessageContentStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: MessageContentConfiguration) -> Body
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
    public let messageContentIdentifier = "FioriMessageContent_messageContent"

    public var componentIdentifier: String = "fiori_messagecontent_component"
    public let messageContent: MessageContent

    public typealias MessageContent = ConfigurationViewWrapper
}

extension MessageContentConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

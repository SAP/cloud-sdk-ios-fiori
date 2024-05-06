// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct MessageContent {
    let messageContent: any View

    @Environment(\.messageContentStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder messageContent: () -> any View = { EmptyView() }) {
        self.messageContent = messageContent()
    }
}

public extension MessageContent {
    init(_ configuration: MessageContentConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: MessageContentConfiguration, shouldApplyDefaultStyle: Bool) {
        self.messageContent = configuration.messageContent
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension MessageContent: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(messageContent: .init(self.messageContent))).typeErased
                .transformEnvironment(\.messageContentStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension MessageContent {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        MessageContent(messageContent: { self.messageContent })
            .shouldApplyDefaultStyle(false)
            .messageContentStyle(.fiori)
            .typeErased
    }
}

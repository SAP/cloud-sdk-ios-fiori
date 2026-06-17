// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol AINoticeStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: AINoticeConfiguration) -> Body
}

struct AnyAINoticeStyle: AINoticeStyle {
    let content: (AINoticeConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AINoticeConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AINoticeConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AINoticeConfiguration {
    public var componentIdentifier: String = "fiori_ainotice_component"
    public let icon: Icon
    public let description: AttributedString?
    public let actionLabel: AttributedString?
    public let viewMoreAction: (() -> Void)?
    public let viewAlignment: HorizontalAlignment

    public typealias Icon = ConfigurationViewWrapper
}

extension AINoticeConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct AINoticeFioriStyle: AINoticeStyle {
    public func makeBody(_ configuration: AINoticeConfiguration) -> some View {
        AINotice(configuration)
            .iconStyle(IconFioriStyle(aINoticeConfiguration: configuration))
    }
}

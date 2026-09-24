// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol AllowActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: AllowActionConfiguration) -> Body
}

struct AnyAllowActionStyle: AllowActionStyle {
    let content: (AllowActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AllowActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AllowActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AllowActionConfiguration {
    public var componentIdentifier: String = "fiori_allowaction_component"
    public let allowAction: AllowAction

    public typealias AllowAction = ConfigurationViewWrapper
}

extension AllowActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct AllowActionDefaultStyle: AllowActionStyle {
    nonisolated init() {}

    func makeBody(_ configuration: AllowActionConfiguration) -> some View {
        AllowAction(configuration)
            .allowActionStyle(AllowActionBaseStyle())
    }
}

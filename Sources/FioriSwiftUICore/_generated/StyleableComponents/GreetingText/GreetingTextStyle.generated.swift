// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol GreetingTextStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: GreetingTextConfiguration) -> Body
}

struct AnyGreetingTextStyle: GreetingTextStyle {
    let content: (GreetingTextConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (GreetingTextConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: GreetingTextConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct GreetingTextConfiguration {
    public var componentIdentifier: String = "fiori_greetingtext_component"
    public let greetingText: GreetingText

    public typealias GreetingText = ConfigurationViewWrapper
}

extension GreetingTextConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct GreetingTextDefaultStyle: GreetingTextStyle {
    nonisolated init() {}

    func makeBody(_ configuration: GreetingTextConfiguration) -> some View {
        GreetingText(configuration)
            .greetingTextStyle(GreetingTextBaseStyle())
    }
}

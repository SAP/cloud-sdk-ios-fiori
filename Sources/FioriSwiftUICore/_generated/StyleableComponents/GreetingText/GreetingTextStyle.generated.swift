// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol GreetingTextStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: GreetingTextConfiguration) -> Body
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
    public let greetingTextIdentifier = "FioriGreetingText_greetingText"

    public var componentIdentifier: String = "fiori_greetingtext_component"
    public let greetingText: GreetingText

    public typealias GreetingText = ConfigurationViewWrapper
}

extension GreetingTextConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

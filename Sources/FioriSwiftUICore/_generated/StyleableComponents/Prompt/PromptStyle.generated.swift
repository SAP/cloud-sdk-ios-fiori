// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol PromptStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: PromptConfiguration) -> Body
}

struct AnyPromptStyle: PromptStyle {
    let content: (PromptConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (PromptConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: PromptConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct PromptConfiguration {
    public var componentIdentifier: String = "fiori_prompt_component"
    public let prompt: Prompt

    public typealias Prompt = ConfigurationViewWrapper
}

extension PromptConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

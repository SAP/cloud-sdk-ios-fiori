// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Prompt {
    let prompt: any View

    @Environment(\.promptStyle) var style

    var componentIdentifier: String = Prompt.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder prompt: () -> any View = { EmptyView() },
                componentIdentifier: String? = Prompt.identifier)
    {
        self.prompt = prompt()
        self.componentIdentifier = componentIdentifier ?? Prompt.identifier
    }
}

public extension Prompt {
    static let identifier = "fiori_prompt_component"
}

public extension Prompt {
    init(prompt: AttributedString? = nil) {
        self.init(prompt: { OptionalText(prompt) })
    }
}

public extension Prompt {
    init(_ configuration: PromptConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: PromptConfiguration, shouldApplyDefaultStyle: Bool) {
        self.prompt = configuration.prompt
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Prompt: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, prompt: .init(self.prompt))).typeErased
                .transformEnvironment(\.promptStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Prompt {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Prompt(.init(componentIdentifier: self.componentIdentifier, prompt: .init(self.prompt)))
            .shouldApplyDefaultStyle(false)
            .promptStyle(.fiori)
            .typeErased
    }
}

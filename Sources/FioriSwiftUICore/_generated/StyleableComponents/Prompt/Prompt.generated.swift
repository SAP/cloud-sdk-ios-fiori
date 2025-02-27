// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Prompt {
    let prompt: any View

    @Environment(\.promptStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder prompt: () -> any View = { EmptyView() }) {
        self.prompt = prompt()
    }
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
    }
}

extension Prompt: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(prompt: .init(self.prompt))).typeErased
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
        Prompt(.init(prompt: .init(self.prompt)))
            .shouldApplyDefaultStyle(false)
            .promptStyle(.fiori)
            .typeErased
    }
}

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct GreetingText {
    let greetingText: any View

    @Environment(\.greetingTextStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder greetingText: () -> any View) {
        self.greetingText = greetingText()
    }
}

public extension GreetingText {
    init(greetingText: AttributedString) {
        self.init(greetingText: { Text(greetingText) })
    }
}

public extension GreetingText {
    init(_ configuration: GreetingTextConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: GreetingTextConfiguration, shouldApplyDefaultStyle: Bool) {
        self.greetingText = configuration.greetingText
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension GreetingText: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(greetingText: .init(self.greetingText))).typeErased
                .transformEnvironment(\.greetingTextStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension GreetingText {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        GreetingText(greetingText: { self.greetingText })
            .shouldApplyDefaultStyle(false)
            .greetingTextStyle(.fiori)
            .typeErased
    }
}

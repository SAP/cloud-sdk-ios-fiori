// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Key {
    let key: any View

    @Environment(\.keyStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder key: () -> any View) {
        self.key = key()
    }
}

public extension Key {
    init(key: AttributedString) {
        self.init(key: { Text(key) })
    }
}

public extension Key {
    init(_ configuration: KeyConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: KeyConfiguration, shouldApplyDefaultStyle: Bool) {
        self.key = configuration.key
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension Key: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(key: .init(self.key))).typeErased
                .transformEnvironment(\.keyStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Key {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Key(.init(key: .init(self.key)))
            .shouldApplyDefaultStyle(false)
            .keyStyle(.fiori)
            .typeErased
    }
}

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Placeholder {
    let placeholder: any View

    @Environment(\.placeholderStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder placeholder: () -> any View = { EmptyView() }) {
        self.placeholder = placeholder()
    }
}

public extension Placeholder {
    init(placeholder: AttributedString? = nil) {
        self.init(placeholder: { OptionalText(placeholder) })
    }
}

public extension Placeholder {
    init(_ configuration: PlaceholderConfiguration) {
        self.placeholder = configuration.placeholder
        self._shouldApplyDefaultStyle = false
    }
}

extension Placeholder: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(placeholder: .init(self.placeholder))).typeErased
                .transformEnvironment(\.placeholderStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Placeholder {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        Placeholder(placeholder: { self.placeholder })
            .shouldApplyDefaultStyle(false)
            .placeholderStyle(.fiori)
            .typeErased
    }
}

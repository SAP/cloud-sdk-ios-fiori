// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct HelperText {
    let helperText: any View

    @Environment(\.helperTextStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder helperText: () -> any View = { EmptyView() }) {
        self.helperText = helperText()
    }
}

public extension HelperText {
    init(helperText: AttributedString? = nil) {
        self.init(helperText: { OptionalText(helperText) })
    }
}

public extension HelperText {
    init(_ configuration: HelperTextConfiguration) {
        self.helperText = configuration.helperText
        self._shouldApplyDefaultStyle = false
    }
}

extension HelperText: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(helperText: .init(self.helperText))).typeErased
                .transformEnvironment(\.helperTextStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension HelperText {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        HelperText(helperText: { self.helperText })
            .shouldApplyDefaultStyle(false)
            .helperTextStyle(.fiori)
            .typeErased
    }
}

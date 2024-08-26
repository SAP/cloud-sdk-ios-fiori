// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct FootnoteIconsText {
    let footnoteIconsText: any View

    @Environment(\.footnoteIconsTextStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder footnoteIconsText: () -> any View = { EmptyView() }) {
        self.footnoteIconsText = footnoteIconsText()
    }
}

public extension FootnoteIconsText {
    init(footnoteIconsText: AttributedString? = nil) {
        self.init(footnoteIconsText: { OptionalText(footnoteIconsText) })
    }
}

public extension FootnoteIconsText {
    init(_ configuration: FootnoteIconsTextConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: FootnoteIconsTextConfiguration, shouldApplyDefaultStyle: Bool) {
        self.footnoteIconsText = configuration.footnoteIconsText
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension FootnoteIconsText: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(footnoteIconsText: .init(self.footnoteIconsText))).typeErased
                .transformEnvironment(\.footnoteIconsTextStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension FootnoteIconsText {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        FootnoteIconsText(footnoteIconsText: { self.footnoteIconsText })
            .shouldApplyDefaultStyle(false)
            .footnoteIconsTextStyle(.fiori)
            .typeErased
    }
}

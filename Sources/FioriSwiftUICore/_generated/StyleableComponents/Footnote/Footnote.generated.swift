// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Footnote {
    let footnote: any View

    @Environment(\.footnoteStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder footnote: () -> any View = { EmptyView() }) {
        self.footnote = footnote()
    }
}

public extension Footnote {
    init(footnote: AttributedString? = nil) {
        self.init(footnote: { OptionalText(footnote) })
    }
}

public extension Footnote {
    init(_ configuration: FootnoteConfiguration) {
        self.footnote = configuration.footnote
        self._shouldApplyDefaultStyle = false
    }
}

extension Footnote: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(footnote: .init(self.footnote))).typeErased
                .transformEnvironment(\.footnoteStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Footnote {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        Footnote(footnote: { self.footnote })
            .shouldApplyDefaultStyle(false)
            .footnoteStyle(.fiori)
            .typeErased
    }
}

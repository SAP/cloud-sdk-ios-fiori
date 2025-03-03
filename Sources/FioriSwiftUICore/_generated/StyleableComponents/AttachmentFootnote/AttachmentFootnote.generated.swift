// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AttachmentFootnote {
    let footnote: any View

    @Environment(\.attachmentFootnoteStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder footnote: () -> any View) {
        self.footnote = footnote()
    }
}

public extension AttachmentFootnote {
    init(footnote: AttributedString) {
        self.init(footnote: { Text(footnote) })
    }
}

public extension AttachmentFootnote {
    init(_ configuration: AttachmentFootnoteConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentFootnoteConfiguration, shouldApplyDefaultStyle: Bool) {
        self.footnote = configuration.footnote
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension AttachmentFootnote: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(footnote: .init(self.footnote))).typeErased
                .transformEnvironment(\.attachmentFootnoteStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AttachmentFootnote {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AttachmentFootnote(.init(footnote: .init(self.footnote)))
            .shouldApplyDefaultStyle(false)
            .attachmentFootnoteStyle(.fiori)
            .typeErased
    }
}

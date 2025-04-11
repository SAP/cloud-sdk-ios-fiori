// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AttachmentFootnote {
    let attachmentFootnote: any View

    @Environment(\.attachmentFootnoteStyle) var style

    var componentIdentifier: String = AttachmentFootnote.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder attachmentFootnote: () -> any View,
                componentIdentifier: String? = AttachmentFootnote.identifier)
    {
        self.attachmentFootnote = attachmentFootnote()
        self.componentIdentifier = componentIdentifier ?? AttachmentFootnote.identifier
    }
}

public extension AttachmentFootnote {
    static let identifier = "fiori_attachmentfootnote_component"
}

public extension AttachmentFootnote {
    init(attachmentFootnote: AttributedString) {
        self.init(attachmentFootnote: { Text(attachmentFootnote) })
    }
}

public extension AttachmentFootnote {
    init(_ configuration: AttachmentFootnoteConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentFootnoteConfiguration, shouldApplyDefaultStyle: Bool) {
        self.attachmentFootnote = configuration.attachmentFootnote
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AttachmentFootnote: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, attachmentFootnote: .init(self.attachmentFootnote))).typeErased
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
        AttachmentFootnote(.init(componentIdentifier: self.componentIdentifier, attachmentFootnote: .init(self.attachmentFootnote)))
            .shouldApplyDefaultStyle(false)
            .attachmentFootnoteStyle(.fiori)
            .typeErased
    }
}

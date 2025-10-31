// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AttachmentErrorTitle {
    let attachmentErrorTitle: any View

    @Environment(\.attachmentErrorTitleStyle) var style

    var componentIdentifier: String = AttachmentErrorTitle.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder attachmentErrorTitle: () -> any View,
                componentIdentifier: String? = AttachmentErrorTitle.identifier)
    {
        self.attachmentErrorTitle = attachmentErrorTitle()
        self.componentIdentifier = componentIdentifier ?? AttachmentErrorTitle.identifier
    }
}

public extension AttachmentErrorTitle {
    static let identifier = "fiori_attachmenterrortitle_component"
}

public extension AttachmentErrorTitle {
    init(attachmentErrorTitle: AttributedString) {
        self.init(attachmentErrorTitle: { Text(attachmentErrorTitle) })
    }
}

public extension AttachmentErrorTitle {
    init(_ configuration: AttachmentErrorTitleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentErrorTitleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.attachmentErrorTitle = configuration.attachmentErrorTitle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AttachmentErrorTitle: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, attachmentErrorTitle: .init(self.attachmentErrorTitle))).typeErased
                .transformEnvironment(\.attachmentErrorTitleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AttachmentErrorTitle {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AttachmentErrorTitle(.init(componentIdentifier: self.componentIdentifier, attachmentErrorTitle: .init(self.attachmentErrorTitle)))
            .shouldApplyDefaultStyle(false)
            .attachmentErrorTitleStyle(.fiori)
            .typeErased
    }
}

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AttachmentInProgressTitle {
    let attachmentInProgressTitle: any View

    @Environment(\.attachmentInProgressTitleStyle) var style

    var componentIdentifier: String = AttachmentInProgressTitle.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder attachmentInProgressTitle: () -> any View,
                componentIdentifier: String? = AttachmentInProgressTitle.identifier)
    {
        self.attachmentInProgressTitle = attachmentInProgressTitle()
        self.componentIdentifier = componentIdentifier ?? AttachmentInProgressTitle.identifier
    }
}

public extension AttachmentInProgressTitle {
    static let identifier = "fiori_attachmentinprogresstitle_component"
}

public extension AttachmentInProgressTitle {
    init(attachmentInProgressTitle: AttributedString) {
        self.init(attachmentInProgressTitle: { Text(attachmentInProgressTitle) })
    }
}

public extension AttachmentInProgressTitle {
    init(_ configuration: AttachmentInProgressTitleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentInProgressTitleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.attachmentInProgressTitle = configuration.attachmentInProgressTitle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AttachmentInProgressTitle: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, attachmentInProgressTitle: .init(self.attachmentInProgressTitle))).typeErased
                .transformEnvironment(\.attachmentInProgressTitleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AttachmentInProgressTitle {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AttachmentInProgressTitle(.init(componentIdentifier: self.componentIdentifier, attachmentInProgressTitle: .init(self.attachmentInProgressTitle)))
            .shouldApplyDefaultStyle(false)
            .attachmentInProgressTitleStyle(.fiori)
            .typeErased
    }
}

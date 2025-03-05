// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AttachmentTitle {
    let attachmentTitle: any View

    @Environment(\.attachmentTitleStyle) var style

    var componentIdentifier: String = AttachmentTitle.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder attachmentTitle: () -> any View,
                componentIdentifier: String? = AttachmentTitle.identifier)
    {
        self.attachmentTitle = attachmentTitle()
        self.componentIdentifier = componentIdentifier ?? AttachmentTitle.identifier
    }
}

public extension AttachmentTitle {
    static let identifier = "fiori_attachmenttitle_component"
}

public extension AttachmentTitle {
    init(attachmentTitle: AttributedString) {
        self.init(attachmentTitle: { Text(attachmentTitle) })
    }
}

public extension AttachmentTitle {
    init(_ configuration: AttachmentTitleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentTitleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.attachmentTitle = configuration.attachmentTitle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AttachmentTitle: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, attachmentTitle: .init(self.attachmentTitle))).typeErased
                .transformEnvironment(\.attachmentTitleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AttachmentTitle {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AttachmentTitle(.init(componentIdentifier: self.componentIdentifier, attachmentTitle: .init(self.attachmentTitle)))
            .shouldApplyDefaultStyle(false)
            .attachmentTitleStyle(.fiori)
            .typeErased
    }
}

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AttachmentSubtitle {
    let attachmentSubtitle: any View

    @Environment(\.attachmentSubtitleStyle) var style

    var componentIdentifier: String = AttachmentSubtitle.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder attachmentSubtitle: () -> any View,
                componentIdentifier: String? = AttachmentSubtitle.identifier)
    {
        self.attachmentSubtitle = attachmentSubtitle()
        self.componentIdentifier = componentIdentifier ?? AttachmentSubtitle.identifier
    }
}

public extension AttachmentSubtitle {
    static let identifier = "fiori_attachmentsubtitle_component"
}

public extension AttachmentSubtitle {
    init(attachmentSubtitle: AttributedString) {
        self.init(attachmentSubtitle: { Text(attachmentSubtitle) })
    }
}

public extension AttachmentSubtitle {
    init(_ configuration: AttachmentSubtitleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentSubtitleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.attachmentSubtitle = configuration.attachmentSubtitle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AttachmentSubtitle: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, attachmentSubtitle: .init(self.attachmentSubtitle))).typeErased
                .transformEnvironment(\.attachmentSubtitleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AttachmentSubtitle {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AttachmentSubtitle(.init(componentIdentifier: self.componentIdentifier, attachmentSubtitle: .init(self.attachmentSubtitle)))
            .shouldApplyDefaultStyle(false)
            .attachmentSubtitleStyle(.fiori)
            .typeErased
    }
}

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AttachmentSubtitle {
    let subtitle: any View

    @Environment(\.attachmentSubtitleStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder subtitle: () -> any View) {
        self.subtitle = subtitle()
    }
}

public extension AttachmentSubtitle {
    init(subtitle: AttributedString) {
        self.init(subtitle: { Text(subtitle) })
    }
}

public extension AttachmentSubtitle {
    init(_ configuration: AttachmentSubtitleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentSubtitleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.subtitle = configuration.subtitle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension AttachmentSubtitle: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(subtitle: .init(self.subtitle))).typeErased
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
        AttachmentSubtitle(.init(subtitle: .init(self.subtitle)))
            .shouldApplyDefaultStyle(false)
            .attachmentSubtitleStyle(.fiori)
            .typeErased
    }
}

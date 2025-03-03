// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AttachmentTitle {
    let title: any View

    @Environment(\.attachmentTitleStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View) {
        self.title = title()
    }
}

public extension AttachmentTitle {
    init(title: AttributedString) {
        self.init(title: { Text(title) })
    }
}

public extension AttachmentTitle {
    init(_ configuration: AttachmentTitleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentTitleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension AttachmentTitle: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title))).typeErased
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
        AttachmentTitle(.init(title: .init(self.title)))
            .shouldApplyDefaultStyle(false)
            .attachmentTitleStyle(.fiori)
            .typeErased
    }
}

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct AttachmentThumbnail {
    /// /  URL of document for rendering thumbnail
    let url: URL
    /// The state of attachement group component
    let controlState: ControlState

    @Environment(\.attachmentThumbnailStyle) var style

    var componentIdentifier: String = AttachmentThumbnail.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(url: URL,
                controlState: ControlState = .normal,
                componentIdentifier: String? = AttachmentThumbnail.identifier)
    {
        self.url = url
        self.controlState = controlState
        self.componentIdentifier = componentIdentifier ?? AttachmentThumbnail.identifier
    }
}

public extension AttachmentThumbnail {
    static let identifier = "fiori_attachmentthumbnail_component"
}

public extension AttachmentThumbnail {
    init(_ configuration: AttachmentThumbnailConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentThumbnailConfiguration, shouldApplyDefaultStyle: Bool) {
        self.url = configuration.url
        self.controlState = configuration.controlState
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AttachmentThumbnail: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, url: self.url, controlState: self.controlState)).typeErased
                .transformEnvironment(\.attachmentThumbnailStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AttachmentThumbnail {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AttachmentThumbnail(.init(componentIdentifier: self.componentIdentifier, url: self.url, controlState: self.controlState))
            .shouldApplyDefaultStyle(false)
            .attachmentThumbnailStyle(AttachmentThumbnailFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

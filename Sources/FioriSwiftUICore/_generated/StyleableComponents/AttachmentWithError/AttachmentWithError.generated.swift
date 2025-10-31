// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `AttachmentWithError` is the UI component to be used by `AttachmentGroup` along with `AttachmentButtonImage` to support error state of failed upload.
///
/// ## Usage
/// ```swift
/// AttachmentWithError(
///     attachmentErrorTitle: {
///         Text(configuration.attachmentInfo.attachmentName)
///     },
///     attachmentInfo: configuration.$attachmentInfo,
///     onPreview: configuration.onPreview,
///     onDelete: configuration.onDelete
/// )
/// ```
public struct AttachmentWithError {
    let attachmentErrorTitle: any View
    /// The collection of local attachment data model, which are prepared by Apps.
    let attachmentInfo: AttachmentInfo
    /// Triggering preview
    let onPreview: ((AttachmentInfo) -> Void)?
    /// Triggering delete.
    let onDelete: ((AttachmentInfo) -> Void)?

    @Environment(\.attachmentWithErrorStyle) var style

    var componentIdentifier: String = AttachmentWithError.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder attachmentErrorTitle: () -> any View,
                attachmentInfo: AttachmentInfo,
                onPreview: ((AttachmentInfo) -> Void)? = nil,
                onDelete: ((AttachmentInfo) -> Void)? = nil,
                componentIdentifier: String? = AttachmentWithError.identifier)
    {
        self.attachmentErrorTitle = AttachmentErrorTitle(attachmentErrorTitle: attachmentErrorTitle, componentIdentifier: componentIdentifier)
        self.attachmentInfo = attachmentInfo
        self.onPreview = onPreview
        self.onDelete = onDelete
        self.componentIdentifier = componentIdentifier ?? AttachmentWithError.identifier
    }
}

public extension AttachmentWithError {
    static let identifier = "fiori_attachmentwitherror_component"
}

public extension AttachmentWithError {
    init(attachmentErrorTitle: AttributedString,
         attachmentInfo: AttachmentInfo,
         onPreview: ((AttachmentInfo) -> Void)? = nil,
         onDelete: ((AttachmentInfo) -> Void)? = nil)
    {
        self.init(attachmentErrorTitle: { Text(attachmentErrorTitle) }, attachmentInfo: attachmentInfo, onPreview: onPreview, onDelete: onDelete)
    }
}

public extension AttachmentWithError {
    init(_ configuration: AttachmentWithErrorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentWithErrorConfiguration, shouldApplyDefaultStyle: Bool) {
        self.attachmentErrorTitle = configuration.attachmentErrorTitle
        self.attachmentInfo = configuration.attachmentInfo
        self.onPreview = configuration.onPreview
        self.onDelete = configuration.onDelete
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AttachmentWithError: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, attachmentErrorTitle: .init(self.attachmentErrorTitle), attachmentInfo: self.attachmentInfo, onPreview: self.onPreview, onDelete: self.onDelete)).typeErased
                .transformEnvironment(\.attachmentWithErrorStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AttachmentWithError {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AttachmentWithError(.init(componentIdentifier: self.componentIdentifier, attachmentErrorTitle: .init(self.attachmentErrorTitle), attachmentInfo: self.attachmentInfo, onPreview: self.onPreview, onDelete: self.onDelete))
            .shouldApplyDefaultStyle(false)
            .attachmentWithErrorStyle(AttachmentWithErrorFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

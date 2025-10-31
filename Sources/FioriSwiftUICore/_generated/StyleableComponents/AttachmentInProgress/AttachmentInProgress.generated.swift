// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `AttachmentInProgress` is the UI component to be used by `AttachmentGroup` along with `AttachmentButtonImage` to support rendering in-progress uploading state.
///
/// ## Usage
/// ```swift
/// AttachmentInProgress(
///     attachmentInProgressTitle: {
///         Text(configuration.attachmentInfo.attachmentName)
///     },
///     attachmentInfo: configuration.$attachmentInfo,
///     onPreview: configuration.onPreview,
///     onDelete: configuration.onDelete
/// )
/// ```
public struct AttachmentInProgress {
    let attachmentInProgressTitle: any View
    /// The collection of local attachment data model, which are prepared by Apps.
    let attachmentInfo: AttachmentInfo
    /// Triggering preview
    let onPreview: ((AttachmentInfo) -> Void)?
    /// Triggering delete.
    let onDelete: ((AttachmentInfo) -> Void)?

    @Environment(\.attachmentInProgressStyle) var style

    var componentIdentifier: String = AttachmentInProgress.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder attachmentInProgressTitle: () -> any View,
                attachmentInfo: AttachmentInfo,
                onPreview: ((AttachmentInfo) -> Void)? = nil,
                onDelete: ((AttachmentInfo) -> Void)? = nil,
                componentIdentifier: String? = AttachmentInProgress.identifier)
    {
        self.attachmentInProgressTitle = AttachmentInProgressTitle(attachmentInProgressTitle: attachmentInProgressTitle, componentIdentifier: componentIdentifier)
        self.attachmentInfo = attachmentInfo
        self.onPreview = onPreview
        self.onDelete = onDelete
        self.componentIdentifier = componentIdentifier ?? AttachmentInProgress.identifier
    }
}

public extension AttachmentInProgress {
    static let identifier = "fiori_attachmentinprogress_component"
}

public extension AttachmentInProgress {
    init(attachmentInProgressTitle: AttributedString,
         attachmentInfo: AttachmentInfo,
         onPreview: ((AttachmentInfo) -> Void)? = nil,
         onDelete: ((AttachmentInfo) -> Void)? = nil)
    {
        self.init(attachmentInProgressTitle: { Text(attachmentInProgressTitle) }, attachmentInfo: attachmentInfo, onPreview: onPreview, onDelete: onDelete)
    }
}

public extension AttachmentInProgress {
    init(_ configuration: AttachmentInProgressConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentInProgressConfiguration, shouldApplyDefaultStyle: Bool) {
        self.attachmentInProgressTitle = configuration.attachmentInProgressTitle
        self.attachmentInfo = configuration.attachmentInfo
        self.onPreview = configuration.onPreview
        self.onDelete = configuration.onDelete
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AttachmentInProgress: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, attachmentInProgressTitle: .init(self.attachmentInProgressTitle), attachmentInfo: self.attachmentInfo, onPreview: self.onPreview, onDelete: self.onDelete)).typeErased
                .transformEnvironment(\.attachmentInProgressStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AttachmentInProgress {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AttachmentInProgress(.init(componentIdentifier: self.componentIdentifier, attachmentInProgressTitle: .init(self.attachmentInProgressTitle), attachmentInfo: self.attachmentInfo, onPreview: self.onPreview, onDelete: self.onDelete))
            .shouldApplyDefaultStyle(false)
            .attachmentInProgressStyle(AttachmentInProgressFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

/// `AttachmentThumbnail` is a specialized UI component that renders previews for attachment files asynchronously.
///
/// This component intelligently handles different file types by:
/// - Initially displaying appropriate static file type icons while loading
/// - Generating thumbnail previews for supported file types (images, PDFs, etc.)
/// - Maintaining the file type icon for non-previewable file types
/// - Adapting its appearance based on control state (normal, disabled, read-only)
///
/// The thumbnail generation process happens in the background to maintain UI responsiveness,
/// and the component automatically updates when the preview becomes available.
///
/// ## Usage
/// Use `AttachmentThumbnail` within an `Attachment` component to display file previews:
///
/// ```swift
/// // Basic usage with an image file
/// Attachment {
///   AttachmentThumbnail(url: imageURL)
/// } attachmentTitle: {
///   Text("Photo")
/// } attachmentSubtitle: {
///   Text("2.5MB")
/// } attachmentFootnote: {
///   Text("Oct 20, 2025")
/// }
///
/// // Usage with a PDF document
/// Attachment {
///   AttachmentThumbnail(url: pdfURL, controlState: viewModel.isEditable ? .normal : .readOnly)
/// } attachmentTitle: {
///   Text("Contract")
/// } attachmentSubtitle: {
///   Text("PDF • 1.2MB")
/// } attachmentFootnote: {
///   Text("Last modified today")
/// }
/// ```
///
/// The component can also be used standalone when needed:
///
/// ```swift
/// AttachmentThumbnail(url: fileURL)
/// ```
public struct AttachmentThumbnail {
    /// The URL of the file for which to render a thumbnail.
    ///
    /// This can be a local file URL or a remote URL. For remote URLs, the component
    /// will download the file data as needed to generate the thumbnail.
    let url: URL
    /// The control state that determines the visual appearance of the thumbnail.
    ///
    /// Possible values:
    /// - `.normal`: Standard appearance for interactive contexts (default)
    /// - `.disabled`: Visually indicates the thumbnail is non-interactive
    /// - `.readOnly`: Indicates the attachment is in read-only mode
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

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `AttachmentElement` is a foundational UI component used by `AttachmentGroup` for displaying and managing
/// attachment items in different states (normal, uploading, error).
///
/// This protocol defines the core properties and interactions required for attachment rendering:
/// - Displaying attachment information
/// - Handling state changes through control states
/// - Managing user interactions like previewing and deletion
/// - Supporting dynamic updates to attachment metadata
///
/// `AttachmentElement` serves as the base protocol for more specialized attachment components like
/// `Attachment`, `AttachmentWithError`, and `AttachmentInProgress`.
///
/// ## Usage
/// ```swift
/// // Basic usage with required properties
/// AttachmentElement(
///     attachmentInfo: myAttachmentInfo,
///     controlState: .normal,
///     onPreview: { attachmentInfo in
///         // Handle preview action
///         previewController.preview(attachmentInfo.primaryURL)
///     },
///     onExtraInfoChange: { extraInfo in
///         // Update attachment with new metadata
///         updateAttachment(with: extraInfo)
///     },
///     onDelete: { attachmentInfo in
///         // Handle deletion
///         deleteAttachment(attachmentInfo)
///     }
/// )
///
/// // In context of looping through attachment array
/// ForEach(configuration.attachments.indices, id: \.self) { index in
///     AttachmentElement(
///         attachmentInfo: configuration.attachments[index],
///         controlState: configuration.controlState,
///         onPreview: { info in
///             previewManager.showPreview(for: info)
///         },
///         onExtraInfoChange: { extraInfo in
///             // Update with new metadata while preserving state
///             if case .uploaded(let destURL, let srcURL, _) = configuration.attachments[index] {
///                 configuration.attachments[index] = .uploaded(
///                     destinationURL: destURL,
///                     sourceURL: srcURL,
///                     extraInfo: extraInfo
///                 )
///             }
///         },
///         onDelete: { info in
///             configuration.attachments.remove(at: index)
///         }
///     )
/// }
/// ```
public struct AttachmentElement {
    /// The attachment information object containing metadata and state.
    ///
    /// This property holds the `AttachmentInfo` instance representing the current state
    /// of the attachment (uploading, uploaded, or error) and its associated metadata.
    let attachmentInfo: AttachmentInfo
    /// The control state that determines how the attachment element responds to user interaction.
    ///
    /// Possible values:
    /// - `.normal`: Fully interactive (default)
    /// - `.disabled`: Not interactive but visually unchanged
    /// - `.readOnly`: Not interactive and visually indicates read-only state
    let controlState: ControlState
    /// A closure called when the extra information associated with an attachment needs to be updated.
    ///
    /// This is only applicable to attachments in the `.uploaded` state, and is not relevant for
    /// attachments in `.uploading` or `.error` states.
    ///
    /// - Parameter AttachmentExtraInfo: The new metadata to associate with the attachment
    let onExtraInfoChange: ((any AttachmentExtraInfo) -> Void)?
    /// A closure called when the user requests to preview the attachment.
    ///
    /// This is typically triggered when the user taps on the attachment thumbnail or preview.
    /// Implementations should handle displaying appropriate preview UI for the attachment type.
    ///
    /// - Parameter AttachmentInfo: The attachment information for the attachment to preview
    let onPreview: ((AttachmentInfo) -> Void)?
    /// A closure called when the user requests to delete the attachment.
    ///
    /// This is typically triggered when the user taps a delete button or performs a deletion gesture.
    /// Implementations should handle both UI updates and any backend deletion operations.
    ///
    /// - Parameter AttachmentInfo: The attachment information for the attachment to delete
    let onDelete: ((AttachmentInfo) -> Void)?

    @Environment(\.attachmentElementStyle) var style

    var componentIdentifier: String = AttachmentElement.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(attachmentInfo: AttachmentInfo,
                controlState: ControlState = .normal,
                onExtraInfoChange: ((any AttachmentExtraInfo) -> Void)? = nil,
                onPreview: ((AttachmentInfo) -> Void)? = nil,
                onDelete: ((AttachmentInfo) -> Void)? = nil,
                componentIdentifier: String? = AttachmentElement.identifier)
    {
        self.attachmentInfo = attachmentInfo
        self.controlState = controlState
        self.onExtraInfoChange = onExtraInfoChange
        self.onPreview = onPreview
        self.onDelete = onDelete
        self.componentIdentifier = componentIdentifier ?? AttachmentElement.identifier
    }
}

public extension AttachmentElement {
    static let identifier = "fiori_attachmentelement_component"
}

public extension AttachmentElement {
    init(_ configuration: AttachmentElementConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentElementConfiguration, shouldApplyDefaultStyle: Bool) {
        self.attachmentInfo = configuration.attachmentInfo
        self.controlState = configuration.controlState
        self.onExtraInfoChange = configuration.onExtraInfoChange
        self.onPreview = configuration.onPreview
        self.onDelete = configuration.onDelete
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AttachmentElement: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, attachmentInfo: self.attachmentInfo, controlState: self.controlState, onExtraInfoChange: self.onExtraInfoChange, onPreview: self.onPreview, onDelete: self.onDelete)).typeErased
                .transformEnvironment(\.attachmentElementStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AttachmentElement {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AttachmentElement(.init(componentIdentifier: self.componentIdentifier, attachmentInfo: self.attachmentInfo, controlState: self.controlState, onExtraInfoChange: self.onExtraInfoChange, onPreview: self.onPreview, onDelete: self.onDelete))
            .shouldApplyDefaultStyle(false)
            .attachmentElementStyle(AttachmentElementFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

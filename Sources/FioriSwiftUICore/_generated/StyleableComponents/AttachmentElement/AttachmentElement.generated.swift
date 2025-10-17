// Generated using Sourcery 2.3.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `Attachment` is the UI component to be used by `AttachmentGroup` along with `AttachmentButtonImage` to support users' operation, such as adding a photo or a file and to render attachment list.
///
/// ## Usage
/// ```swift
/// // in context of looping through configuration.attachments array
/// AttachmentElement(attachmentInfo: configuration.$attachments[index], controlState: configuration.controlState) { info in
///     // preview here
/// } onExtraInfoChange: { extraInfo in
///     configuration.$attachments[index] = .uploaded(destinationURL: ...)
/// } onDelete: { info in
///     // delete goes here
/// }
/// ```
public struct AttachmentElement {
    /// The collection of local attachment data model, which are prepared by Apps.
    let attachmentInfo: AttachmentInfo
    /// The state of attachement group component
    let controlState: ControlState
    /// Trigger update on extraInfo of AttachmentInfo; applicable to only Attachment, neither AttachmentWithError nor AttachmentInProgress
    let onExtraInfoChange: ((any AttachmentExtraInfo) -> Void)?
    /// Triggering preview
    let onPreview: ((AttachmentInfo) -> Void)?
    /// Triggering delete.
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

// Generated using Sourcery 2.3.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `Attachment` is the UI component to be used by `AttachmentGroup` along with `AttachmentButtonImage` to support users' operation, such as adding a photo or a file and to render attachment list.
///
/// ## Usage
/// ```swift
/// Attachment {
///   AttachmentThumbnail(url: fileURL)
/// } attachmentTitle: {
///   Text("Leaf")
/// } attachmentSubtitle: {
///   Text("15MB")
/// } attachmentFootnote: {
///   Text("Aug 15, 2024")
/// }
///
/// Attachment {
///   Image(systemName: "leaf")
///     .resizable()
/// } attachmentTitle: {
///   Text("Leaf")
/// } attachmentSubtitle: {
///   Text("15MB")
/// } attachmentFootnote: {
///   Text("Aug 15, 2024")
/// }
/// ```
public struct Attachment {
    let attachmentTitle: any View
    let attachmentSubtitle: any View
    let attachmentFootnote: any View
    /// The collection of local attachment URLs, which are prepared by Apps.
    let attachmentInfo: AttachmentInfo
    /// The state of attachement group component
    let controlState: ControlState
    /// Trigger update on extraInfo of AttachmentInfo
    let onExtraInfoChange: ((AnyHashable) -> Void)?
    /// Triggering preview
    let onPreview: ((AttachmentInfo) -> Void)?
    /// Triggering delete.
    let onDelete: ((AttachmentInfo) -> Void)?

    @Environment(\.attachmentStyle) var style

    var componentIdentifier: String = Attachment.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder attachmentTitle: () -> any View,
                @ViewBuilder attachmentSubtitle: () -> any View,
                @ViewBuilder attachmentFootnote: () -> any View,
                attachmentInfo: AttachmentInfo,
                controlState: ControlState = .normal,
                onExtraInfoChange: ((AnyHashable) -> Void)? = nil,
                onPreview: ((AttachmentInfo) -> Void)? = nil,
                onDelete: ((AttachmentInfo) -> Void)? = nil,
                componentIdentifier: String? = Attachment.identifier)
    {
        self.attachmentTitle = AttachmentTitle(attachmentTitle: attachmentTitle, componentIdentifier: componentIdentifier)
        self.attachmentSubtitle = AttachmentSubtitle(attachmentSubtitle: attachmentSubtitle, componentIdentifier: componentIdentifier)
        self.attachmentFootnote = AttachmentFootnote(attachmentFootnote: attachmentFootnote, componentIdentifier: componentIdentifier)
        self.attachmentInfo = attachmentInfo
        self.controlState = controlState
        self.onExtraInfoChange = onExtraInfoChange
        self.onPreview = onPreview
        self.onDelete = onDelete
        self.componentIdentifier = componentIdentifier ?? Attachment.identifier
    }
}

public extension Attachment {
    static let identifier = "fiori_attachment_component"
}

public extension Attachment {
    init(attachmentTitle: AttributedString,
         attachmentSubtitle: AttributedString,
         attachmentFootnote: AttributedString,
         attachmentInfo: AttachmentInfo,
         controlState: ControlState = .normal,
         onExtraInfoChange: ((AnyHashable) -> Void)? = nil,
         onPreview: ((AttachmentInfo) -> Void)? = nil,
         onDelete: ((AttachmentInfo) -> Void)? = nil)
    {
        self.init(attachmentTitle: { Text(attachmentTitle) }, attachmentSubtitle: { Text(attachmentSubtitle) }, attachmentFootnote: { Text(attachmentFootnote) }, attachmentInfo: attachmentInfo, controlState: controlState, onExtraInfoChange: onExtraInfoChange, onPreview: onPreview, onDelete: onDelete)
    }
}

public extension Attachment {
    init(_ configuration: AttachmentConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentConfiguration, shouldApplyDefaultStyle: Bool) {
        self.attachmentTitle = configuration.attachmentTitle
        self.attachmentSubtitle = configuration.attachmentSubtitle
        self.attachmentFootnote = configuration.attachmentFootnote
        self.attachmentInfo = configuration.attachmentInfo
        self.controlState = configuration.controlState
        self.onExtraInfoChange = configuration.onExtraInfoChange
        self.onPreview = configuration.onPreview
        self.onDelete = configuration.onDelete
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Attachment: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, attachmentTitle: .init(self.attachmentTitle), attachmentSubtitle: .init(self.attachmentSubtitle), attachmentFootnote: .init(self.attachmentFootnote), attachmentInfo: self.attachmentInfo, controlState: self.controlState, onExtraInfoChange: self.onExtraInfoChange, onPreview: self.onPreview, onDelete: self.onDelete)).typeErased
                .transformEnvironment(\.attachmentStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Attachment {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Attachment(.init(componentIdentifier: self.componentIdentifier, attachmentTitle: .init(self.attachmentTitle), attachmentSubtitle: .init(self.attachmentSubtitle), attachmentFootnote: .init(self.attachmentFootnote), attachmentInfo: self.attachmentInfo, controlState: self.controlState, onExtraInfoChange: self.onExtraInfoChange, onPreview: self.onPreview, onDelete: self.onDelete))
            .shouldApplyDefaultStyle(false)
            .attachmentStyle(AttachmentFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

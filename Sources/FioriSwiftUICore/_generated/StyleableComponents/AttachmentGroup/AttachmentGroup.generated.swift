// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `AttachmentGroup` is a UI component that manages a collection of attachments with support for
/// adding, removing, and viewing attachments from various sources.
///
/// This component provides a complete interface for attachment management, including:
/// - Displaying existing attachments with thumbnails
/// - Adding new attachments from photos, camera, files, or scanned documents
/// - Previewing attachments
/// - Showing upload progress and error states
/// - Enforcing maximum attachment limits
///
/// ## Usage
/// ```swift
/// @State private var attachments: [AttachmentInfo] = []
/// @State private var errorMessage: AttributedString?
/// let myAttachmentDelegate = MyAttachmentDelegate()
///
/// AttachmentGroup(
///    title: { Text("Documents") },
///    attachments: $attachments,
///    maxCount: 5,
///    delegate: myAttachmentDelegate,
///    errorMessage: $errorMessage,
///    operations: {
///        AttachmentButtonImage()
///            .operationsMenu {
///                PhotosPickerMenuItem(filter: [.images])
///                FilesPickerMenuItem(filter: [.pdf, .documents])
///                CameraMenuItem()
///            }
///    }
/// )
/// ```
///
/// How the `AttachmentGroup` Works and App Responsibilities:
/// The primary data model is an array of AttachmentInfo, which contains the URL(s) and the attachment state. `AttachmentGroup` relies on the app to prepare attachments for display.
/// Apps are responsible for pre-configuring attachments (e.g., for a "download" use case) in the app’s local folder.
/// Eager downloading is the recommended default approach for attachment previewing.
///
/// How Apps Handle Uploading:
/// The AttachmentGroup component is agnostic about the upload destination and method. It uses a delegate pattern for upload logic.
/// Apps must provide an app-specific AttachmentDelegate (a Swift protocol) to handle the actual upload process.
/// A [`BasicAttachmentDelegate`](https://github.com/SAP/cloud-sdk-ios-fiori/blob/main/Sources/FioriSwiftUICore/Attachment/BasicAttachmentDelegate.swift) is provided for demonstration or as a base for customization.
///
/// Styling and Customizing the UI:
/// By default, all SDK components are **Fiori Design compliant**. However, Apps have significant control over the UI, including layout, fonts, and colors.
/// Apps can fully customize the attachment icon, information, and even add interactive elements. See `MyAttachmentThumbnailMaskStyle` in
///  [`AttachmentGroupExample.swift`](https://github.com/SAP/cloud-sdk-ios-fiori/blob/main/Apps/Examples/Examples/FioriSwiftUICore/Attachment/AttachmentGroupExample.swift).
/// Apps can also use a completely different layout see `MyAttachmentGroupListStyle`, `MyAttachmentStyleForListLayout`, `MyAttachmentInProgressStyleForListLayout`,
/// and `MyAttachmentWithErrorStyleForListLayout` in [`AttachmentGroupExample.swift`](https://github.com/SAP/cloud-sdk-ios-fiori/blob/main/Apps/Examples/Examples/FioriSwiftUICore/Attachment/AttachmentGroupExample.swift).
///
/// Custom Preview:
/// Apps can override the default preview behavior by providing an onPreview closure. See the`onPreview` closure, see `onPreview` parameter in [`AttachmentGroupExample.swift`](https://github.com/SAP/cloud-sdk-ios-fiori/blob/main/Apps/Examples/Examples/FioriSwiftUICore/Attachment/AttachmentGroupExample.swift).
///
/// Apps-Specific Attachment Cache:
/// The `BasicAttachmentDelegate` includes a "cache" folder concept that may suit your requirements.
/// Apps can use similar code in the "Batch" button action in [`AttachmentGroupExample.swift`](https://github.com/SAP/cloud-sdk-ios-fiori/blob/main/Apps/Examples/Examples/FioriSwiftUICore/Attachment/AttachmentGroupExample.swift) for synchroizing attachments between App local storage and backend server.
public struct AttachmentGroup {
    let title: any View
    let context: AttachmentContext
    /// The collection of local attachment URLs, which are prepared by Apps.
    @Binding var attachments: [AttachmentInfo]
    /// The maximum number of attachments
    let maxCount: Int?
    /// App specific attachment processing logics for adding or deleting attachments.
    let delegate: AttachmentDelegate
    /// The state of attachment group component
    let controlState: ControlState
    /// The error message of the form view.
    @Binding var errorMessage: AttributedString?
    /// For adding App specific operations, such as picking photos and files.
    let operations: any View
    /// Triggering App specific preview, otherwise using default preview.
    let onPreview: ((URL) -> Void)?
    /// Allows apps to provide extra info, which is to be used in custom AttachmentStyle
    let defaultAttachmentExtraInfo: (() -> any AttachmentExtraInfo)?

    @Environment(\.attachmentGroupStyle) var style

    var componentIdentifier: String = AttachmentGroup.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                context: AttachmentContext = AttachmentContext(),
                attachments: Binding<[AttachmentInfo]>,
                maxCount: Int? = nil,
                delegate: AttachmentDelegate = BasicAttachmentDelegate(),
                controlState: ControlState = .normal,
                errorMessage: Binding<AttributedString?> = .constant(nil),
                @ViewBuilder operations: () -> any View = { EmptyView() },
                onPreview: ((URL) -> Void)? = nil,
                defaultAttachmentExtraInfo: (() -> any AttachmentExtraInfo)? = nil,
                componentIdentifier: String? = AttachmentGroup.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.context = context
        self._attachments = attachments
        self.maxCount = maxCount
        self.delegate = delegate
        self.controlState = controlState
        self._errorMessage = errorMessage
        self.operations = operations()
        self.onPreview = onPreview
        self.defaultAttachmentExtraInfo = defaultAttachmentExtraInfo
        self.componentIdentifier = componentIdentifier ?? AttachmentGroup.identifier
    }
}

public extension AttachmentGroup {
    static let identifier = "fiori_attachmentgroup_component"
}

public extension AttachmentGroup {
    init(title: AttributedString,
         mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         isRequired: Bool = false,
         context: AttachmentContext = AttachmentContext(),
         attachments: Binding<[AttachmentInfo]>,
         maxCount: Int? = nil,
         delegate: AttachmentDelegate = BasicAttachmentDelegate(),
         controlState: ControlState = .normal,
         errorMessage: Binding<AttributedString?>,
         @ViewBuilder operations: () -> any View = { EmptyView() },
         onPreview: ((URL) -> Void)? = nil,
         defaultAttachmentExtraInfo: (() -> any AttachmentExtraInfo)? = nil)
    {
        self.init(title: {
            TextWithMandatoryFieldIndicator(text: title, isRequired: isRequired, mandatoryFieldIndicator: mandatoryFieldIndicator)
        }, context: context, attachments: attachments, maxCount: maxCount, delegate: delegate, controlState: controlState, errorMessage: errorMessage, operations: operations, onPreview: onPreview, defaultAttachmentExtraInfo: defaultAttachmentExtraInfo)
    }
}

public extension AttachmentGroup {
    init(_ configuration: AttachmentGroupConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentGroupConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.context = configuration.context
        self._attachments = configuration.$attachments
        self.maxCount = configuration.maxCount
        self.delegate = configuration.delegate
        self.controlState = configuration.controlState
        self._errorMessage = configuration.$errorMessage
        self.operations = configuration.operations
        self.onPreview = configuration.onPreview
        self.defaultAttachmentExtraInfo = configuration.defaultAttachmentExtraInfo
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AttachmentGroup: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), context: self.context, attachments: self.$attachments, maxCount: self.maxCount, delegate: self.delegate, controlState: self.controlState, errorMessage: self.$errorMessage, operations: .init(self.operations), onPreview: self.onPreview, defaultAttachmentExtraInfo: self.defaultAttachmentExtraInfo)).typeErased
                .transformEnvironment(\.attachmentGroupStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AttachmentGroup {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AttachmentGroup(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), context: self.context, attachments: self.$attachments, maxCount: self.maxCount, delegate: self.delegate, controlState: self.controlState, errorMessage: self.$errorMessage, operations: .init(self.operations), onPreview: self.onPreview, defaultAttachmentExtraInfo: self.defaultAttachmentExtraInfo))
            .shouldApplyDefaultStyle(false)
            .attachmentGroupStyle(AttachmentGroupFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

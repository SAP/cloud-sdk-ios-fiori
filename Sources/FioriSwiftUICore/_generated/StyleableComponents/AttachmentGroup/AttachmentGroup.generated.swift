// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `AttachmentGroup` is the UI component for adding, removing, and rendering thumbnails and previews.
///
/// ## Usage
/// ```swift
/// AttachmentGroup(
///   title: { Text("Attachements") },
///   attachments: self.$attachments,
///   maxCount: 5,
///   delegate: self.delegate,
///   errorMessage: self.$attachmentError,
///   operations: {
///       AttachmentButtonImage()
///           .operationsMenu {
///               PhotosPickerMenuItem(filter: [.images])
///               FilesPickerMenuItem(filter: [.pdf, .presentation])
///           }
///       }
///  )
/// ```
public struct AttachmentGroup {
    let title: any View
    /// The collection of local attachment URLs, which are prepared by Apps.
    @Binding var attachments: [URL]
    /// The maximium number of attachments
    let maxCount: Int?
    /// App specific attachemnt processing logics for adding or deleting attachments.
    let delegate: AttachmentDelegate
    /// The state of attachement group component
    let controlState: ControlState
    /// The error message of the form view.
    @Binding var errorMessage: AttributedString?
    /// For adding App specific operations, such as picking photos and files.
    let operations: any View
    /// Triggering App specific preview, otherwise using default preview.
    let onPreview: ((URL) -> Void)?

    @Environment(\.attachmentGroupStyle) var style

    var componentIdentifier: String = AttachmentGroup.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                attachments: Binding<[URL]>,
                maxCount: Int? = nil,
                delegate: AttachmentDelegate = BasicAttachmentDelegate(),
                controlState: ControlState = .normal,
                errorMessage: Binding<AttributedString?> = .constant(nil),
                @ViewBuilder operations: () -> any View = { EmptyView() },
                onPreview: ((URL) -> Void)? = nil,
                componentIdentifier: String? = AttachmentGroup.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self._attachments = attachments
        self.maxCount = maxCount
        self.delegate = delegate
        self.controlState = controlState
        self._errorMessage = errorMessage
        self.operations = operations()
        self.onPreview = onPreview
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
         attachments: Binding<[URL]>,
         maxCount: Int? = nil,
         delegate: AttachmentDelegate = BasicAttachmentDelegate(),
         controlState: ControlState = .normal,
         errorMessage: Binding<AttributedString?>,
         @ViewBuilder operations: () -> any View = { EmptyView() },
         onPreview: ((URL) -> Void)? = nil)
    {
        self.init(title: {
            TextWithMandatoryFieldIndicator(text: title, isRequired: isRequired, mandatoryFieldIndicator: mandatoryFieldIndicator)
        }, attachments: attachments, maxCount: maxCount, delegate: delegate, controlState: controlState, errorMessage: errorMessage, operations: operations, onPreview: onPreview)
    }
}

public extension AttachmentGroup {
    init(_ configuration: AttachmentGroupConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttachmentGroupConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self._attachments = configuration.$attachments
        self.maxCount = configuration.maxCount
        self.delegate = configuration.delegate
        self.controlState = configuration.controlState
        self._errorMessage = configuration.$errorMessage
        self.operations = configuration.operations
        self.onPreview = configuration.onPreview
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AttachmentGroup: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), attachments: self.$attachments, maxCount: self.maxCount, delegate: self.delegate, controlState: self.controlState, errorMessage: self.$errorMessage, operations: .init(self.operations), onPreview: self.onPreview)).typeErased
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
        AttachmentGroup(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), attachments: self.$attachments, maxCount: self.maxCount, delegate: self.delegate, controlState: self.controlState, errorMessage: self.$errorMessage, operations: .init(self.operations), onPreview: self.onPreview))
            .shouldApplyDefaultStyle(false)
            .attachmentGroupStyle(AttachmentGroupFioriStyle.ContentFioriStyle())
            .typeErased
    }
}

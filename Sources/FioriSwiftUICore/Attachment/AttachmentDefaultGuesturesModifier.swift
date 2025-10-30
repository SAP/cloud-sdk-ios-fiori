import FioriThemeManager
import SwiftUI

/// A view modifier that adds default preview and delete gestures and actions to an attachment view.
///
/// `AttachmentDefaultGuesturesModifier` enables standard user interactions for attachment components, such as tapping to preview, accessibility actions for preview and delete, and a context menu with preview and delete options. The modifier adapts its behavior based on the attachment's control state:
/// - In `.normal` state, both preview and delete actions are available.
/// - In `.readOnly` state, only preview is available.
/// - In other states, actions are disabled.
///
/// This modifier is typically applied via the `attachmentDefaultGuestures(configuration:)` view extension.
///
/// - Parameter configuration: The configuration describing the attachment, its state, and the preview/delete callbacks.
///
/// ### Example Usage
/// ```swift
/// AttachmentView(...)
///     .attachmentDefaultGuestures(configuration: myAttachmentConfig)
/// ```
public struct AttachmentDefaultGuesturesModifier: ViewModifier {
    var configuration: AttachmentConfiguration
    public func body(content: Content) -> some View {
        content
            .onTapGesture {
                configuration.onPreview?(configuration.attachmentInfo)
            }
            .ifApply(configuration.controlState == .normal || configuration.controlState == .readOnly) {
                $0.accessibilityAction(named: NSLocalizedString("Preview", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Preview")) {
                    configuration.onPreview?(configuration.attachmentInfo)
                }
                .ifApply(configuration.controlState == .normal) {
                    $0.accessibilityAction(named: NSLocalizedString("Delete", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Delete")) {
                        configuration.onDelete?(configuration.attachmentInfo)
                    }
                }
            }
            .ifApply(configuration.controlState == .normal || configuration.controlState == .readOnly) {
                $0.contextMenu {
                    Button {
                        configuration.onPreview?(configuration.attachmentInfo)
                    } label: {
                        Label(NSLocalizedString("Preview", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Preview"), systemImage: "viewfinder")
                    }
                    if configuration.controlState == .normal {
                        Button(role: .destructive) {
                            configuration.onDelete?(configuration.attachmentInfo)
                        } label: {
                            Label(NSLocalizedString("Delete", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Delete"), systemImage: "delete.left")
                        }
                    }
                }
            }
    }
}

public extension View {
    /// Applies default preview and delete operations to an attachment view.
    func attachmentDefaultGuestures(configuration: AttachmentConfiguration) -> some View {
        modifier(AttachmentDefaultGuesturesModifier(configuration: configuration))
    }
}

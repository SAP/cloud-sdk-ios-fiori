import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentBaseStyle: AttachmentStyle {
    public func makeBody(_ configuration: AttachmentConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            AttachmentThumbnail(url: configuration.attachmentInfo.primaryURL, controlState: configuration.controlState)
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(NSLocalizedString("Thumbnail", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Thumbnail"))
                .id(UUID().uuidString)
            VStack(alignment: .leading, spacing: 2) {
                configuration.attachmentTitle
                configuration.attachmentSubtitle
                configuration.attachmentFootnote
            }
        }
        .frame(width: AttachmentConstants.thumbnailWidth)
        .id("Attachment:Thumbnail\(configuration.attachmentInfo.primaryURL.absoluteString)")
        .accessibilityIdentifier("Attachment:Thumbnail\(configuration.attachmentInfo.primaryURL.absoluteString)")
        .accessibilityElement(children: .combine)
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

// Default fiori styles
extension AttachmentFioriStyle {
    struct ContentFioriStyle: AttachmentStyle {
        func makeBody(_ configuration: AttachmentConfiguration) -> some View {
            Attachment(configuration)
        }
    }
    
    struct AttachmentThumbnailFioriStyle: AttachmentThumbnailStyle {
        let attachmentConfiguration: AttachmentConfiguration
        
        func makeBody(_ configuration: AttachmentThumbnailConfiguration) -> some View {
            AttachmentThumbnail(configuration)
        }
    }

    struct AttachmentTitleFioriStyle: AttachmentTitleStyle {
        let attachmentConfiguration: AttachmentConfiguration
        
        func makeBody(_ configuration: AttachmentTitleConfiguration) -> some View {
            AttachmentTitle(configuration)
                .foregroundStyle(self.attachmentConfiguration.controlState == .disabled ? Color.preferredColor(.quaternaryLabel) : Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .caption2, weight: .semibold))
                .lineLimit(2)
        }
    }
    
    struct AttachmentSubtitleFioriStyle: AttachmentSubtitleStyle {
        let attachmentConfiguration: AttachmentConfiguration
        
        func makeBody(_ configuration: AttachmentSubtitleConfiguration) -> some View {
            AttachmentSubtitle(configuration)
                .foregroundStyle(self.attachmentConfiguration.controlState == .disabled ? Color.preferredColor(.quaternaryLabel) : Color.preferredColor(.secondaryLabel))
                .font(.fiori(forTextStyle: .caption2))
                .lineLimit(1)
        }
    }
    
    struct AttachmentFootnoteFioriStyle: AttachmentFootnoteStyle {
        let attachmentConfiguration: AttachmentConfiguration
        
        func makeBody(_ configuration: AttachmentFootnoteConfiguration) -> some View {
            AttachmentFootnote(configuration)
                .foregroundStyle(self.attachmentConfiguration.controlState == .disabled ? Color.preferredColor(.quaternaryLabel) : Color.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .caption2))
                .lineLimit(1)
        }
    }
}

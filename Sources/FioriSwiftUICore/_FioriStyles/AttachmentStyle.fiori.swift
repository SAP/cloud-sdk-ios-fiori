import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentBaseStyle: AttachmentStyle {
    public func makeBody(_ configuration: AttachmentConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            let _ = print("AttachmentBaseStyle: \(configuration.url)")
            AttachmentThumbnail(url: configuration.url, controlState: configuration.controlState)
                .id(UUID().uuidString)
            VStack(alignment: .leading, spacing: 2) {
                configuration.attachmentTitle
                configuration.attachmentSubtitle
                configuration.attachmentFootnote
            }
        }
        .frame(width: AttachmentConstants.cellWidth)
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
                .opacity(self.attachmentConfiguration.controlState == .disabled ? 0.5 : 1.0)
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

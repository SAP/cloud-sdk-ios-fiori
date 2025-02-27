import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentBaseStyle: AttachmentStyle {
    public func makeBody(_ configuration: AttachmentConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            AttachmentThumbnail(url: configuration.url)
                .opacity(configuration.controlState == .disabled ? 0.5 : 1.0)

            VStack(alignment: .leading, spacing: 2) {
                configuration.title
                configuration.subtitle
                configuration.timestamp
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
    
    struct DetailImageFioriStyle: DetailImageStyle {
        let attachmentConfiguration: AttachmentConfiguration
        
        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let attachmentConfiguration: AttachmentConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
//                .foregroundStyle(.red)
//                .font(.footnote)
                .foregroundStyle(self.attachmentConfiguration.controlState == .disabled ? Color.preferredColor(.quaternaryLabel) : Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .caption2, weight: .semibold))
                .lineLimit(2)
        }
    }
    
    struct SubtitleFioriStyle: SubtitleStyle {
        let attachmentConfiguration: AttachmentConfiguration
        
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .foregroundStyle(self.attachmentConfiguration.controlState == .disabled ? Color.preferredColor(.quaternaryLabel) : Color.preferredColor(.secondaryLabel))
                .font(.fiori(forTextStyle: .caption2))
                .lineLimit(1)
        }
    }
    
    struct TimestampFioriStyle: TimestampStyle {
        let attachmentConfiguration: AttachmentConfiguration
        
        func makeBody(_ configuration: TimestampConfiguration) -> some View {
            Timestamp(configuration)
                .foregroundStyle(self.attachmentConfiguration.controlState == .disabled ? Color.preferredColor(.quaternaryLabel) : Color.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .caption2))
                .lineLimit(1)
        }
    }
}

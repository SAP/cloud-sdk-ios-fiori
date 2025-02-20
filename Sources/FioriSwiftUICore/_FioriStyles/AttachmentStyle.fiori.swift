import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentBaseStyle: AttachmentStyle {
    public func makeBody(_ configuration: AttachmentConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            AttachmentThumbnail(url: configuration.url)
                .opacity(configuration.controlState == .disabled ? 0.7 : 1.0)

            VStack(alignment: .leading, spacing: 2) {
                configuration.title
                    .foregroundStyle(configuration.controlState == .disabled ? Color.preferredColor(.quaternaryLabel) : Color.preferredColor(.primaryLabel))
                    .font(.fiori(forTextStyle: .caption2, weight: .semibold))
                    .lineLimit(2)
                configuration.subtitle
                    .foregroundStyle(configuration.controlState == .disabled ? Color.preferredColor(.quaternaryLabel) : Color.preferredColor(.secondaryLabel))
                    .font(.fiori(forTextStyle: .caption2))
                    .lineLimit(1)
                configuration.timestamp
                    .foregroundStyle(configuration.controlState == .disabled ? Color.preferredColor(.quaternaryLabel) : Color.preferredColor(.tertiaryLabel))
                    .font(.fiori(forTextStyle: .caption2))
                    .lineLimit(1)
            }
        }
        .frame(width: 109)
    }
}

// Default fiori styles
extension AttachmentFioriStyle {
    struct ContentFioriStyle: AttachmentStyle {
        func makeBody(_ configuration: AttachmentConfiguration) -> some View {
            Attachment(configuration)
            // Add default style for its content
            // .background()
        }
    }
    
    struct DetailImageFioriStyle: DetailImageStyle {
        let attachmentConfiguration: AttachmentConfiguration
        
        func makeBody(_ configuration: DetailImageConfiguration) -> some View {
            DetailImage(configuration)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 16)
//                        .stroke(.blue)
//                )
        }
    }
    
    struct TitleFioriStyle: TitleStyle {
        let attachmentConfiguration: AttachmentConfiguration
        
        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
        }
    }
    
    struct SubtitleFioriStyle: SubtitleStyle {
        let attachmentConfiguration: AttachmentConfiguration
        
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
        }
    }
    
    struct TimestampFioriStyle: TimestampStyle {
        let attachmentConfiguration: AttachmentConfiguration
        
        func makeBody(_ configuration: TimestampConfiguration) -> some View {
            Timestamp(configuration)
        }
    }
}

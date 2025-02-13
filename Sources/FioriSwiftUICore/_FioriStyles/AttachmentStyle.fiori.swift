import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentBaseStyle: AttachmentStyle {
    public func makeBody(_ configuration: AttachmentConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            AttachmentThumbnail(url: configuration.url)

            VStack(alignment: .leading, spacing: 2) {
                configuration.title
                configuration.subtitle
                configuration.timestamp
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
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .caption2, weight: .semibold))
                .lineLimit(2)
        }
    }
    
    struct SubtitleFioriStyle: SubtitleStyle {
        let attachmentConfiguration: AttachmentConfiguration
        
        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .foregroundStyle(Color.preferredColor(.secondaryLabel))
                .font(.fiori(forTextStyle: .caption2))
                .lineLimit(1)
        }
    }
    
    struct TimestampFioriStyle: TimestampStyle {
        let attachmentConfiguration: AttachmentConfiguration
        
        func makeBody(_ configuration: TimestampConfiguration) -> some View {
            Timestamp(configuration)
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .caption2))
                .lineLimit(1)
        }
    }
}

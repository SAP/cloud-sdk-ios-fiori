import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentInProgressBaseStyle: AttachmentInProgressStyle {
    public func makeBody(_ configuration: AttachmentInProgressConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack(alignment: .center) {
                ZStack {
                    ProgressView()
                        .frame(width: AttachmentConstants.iconWidth, height: AttachmentConstants.iconHeight)
                }
            }
            .frame(width: AttachmentConstants.thumbnailWidth, height: AttachmentConstants.thumbnailHeight)
            .clipShape(
                RoundedRectangle(cornerRadius: AttachmentConstants.thumbnailCornerRadius)
            )
            .overlay(
                RoundedRectangle(cornerRadius: AttachmentConstants.thumbnailCornerRadius)
                    .stroke(Color.preferredColor(.separator), lineWidth: AttachmentConstants.thumbnailBorderLineWidth)
            )
            
            VStack(alignment: .leading, spacing: 2) {
                configuration.attachmentInProgressTitle
            }
        }
        .id("Attachment:InProgress\(configuration.attachmentInfo.primaryURL.absoluteString)")
        .accessibilityIdentifier("Attachment:InProgress\(configuration.attachmentInfo.primaryURL.absoluteString)")
        .accessibilityElement(children: .combine)
        .accessibilityLabel(self.formatInProgressMessage(configuration: configuration))
        .frame(width: AttachmentConstants.thumbnailWidth)
    }
    
    func formatInProgressMessage(configuration: AttachmentInProgressConfiguration) -> String {
        let localizedErrorMessage = NSLocalizedString("Attachment uploading", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Uploadding attachment %@, please wait...")
        return String(format: localizedErrorMessage, configuration.attachmentInfo.primaryURL.lastPathComponent)
    }
}

// Default fiori styles
extension AttachmentInProgressFioriStyle {
    struct ContentFioriStyle: AttachmentInProgressStyle {
        func makeBody(_ configuration: AttachmentInProgressConfiguration) -> some View {
            AttachmentInProgress(configuration)
        }
    }
    
    struct AttachmentInProgressTitleFioriStyle: AttachmentInProgressTitleStyle {
        let attachmentInProgressConfiguration: AttachmentInProgressConfiguration
        
        func makeBody(_ configuration: AttachmentInProgressTitleConfiguration) -> some View {
            AttachmentInProgressTitle(configuration)
                .foregroundStyle(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .caption2, weight: .semibold))
                .lineLimit(2)
        }
    }
}

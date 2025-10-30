import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentThumbnailBaseStyle: AttachmentThumbnailStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttachmentThumbnailConfiguration) -> some View {
        Self.getDefaultThumbnail(url: configuration.url)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: AttachmentConstants.iconWidth, height: AttachmentConstants.iconHeight)
            .frame(width: AttachmentConstants.thumbnailWidth, height: AttachmentConstants.thumbnailHeight)
            .contentShape(Rectangle())
            .foregroundStyle(Color.preferredColor(.tertiaryLabel))
            .overlay(
                RoundedRectangle(cornerRadius: AttachmentConstants.thumbnailCornerRadius)
                    .stroke(Color.preferredColor(.separator), lineWidth: AttachmentConstants.thumbnailBorderLineWidth)
            )
    }
}

// Default fiori styles
extension AttachmentThumbnailFioriStyle {
    struct ContentFioriStyle: AttachmentThumbnailStyle {
        func makeBody(_ configuration: AttachmentThumbnailConfiguration) -> some View {
            AttachmentThumbnail(configuration)
                .ifApply(configuration.controlState == .disabled) {
                    $0.opacity(0.5)
                }
        }
    }
}

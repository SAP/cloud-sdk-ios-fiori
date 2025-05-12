import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentThumbnailBaseStyle: AttachmentThumbnailStyle {
    @State var image: AnyView? = nil

    @ViewBuilder
    public func makeBody(_ configuration: AttachmentThumbnailConfiguration) -> some View {
        if let image {
            image
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .frame(width: AttachmentConstants.iconWidth, height: AttachmentConstants.iconHeight)
                .frame(width: AttachmentConstants.thumbnailWidth, height: AttachmentConstants.thumbnailHeight)
                .clipShape(
                    RoundedRectangle(cornerRadius: AttachmentConstants.thumbnailCornerRadius)
                )
        } else {
            Self.getDefaultThumbnail(url: configuration.url)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .frame(width: AttachmentConstants.iconWidth, height: AttachmentConstants.iconHeight)
                .frame(width: AttachmentConstants.thumbnailWidth, height: AttachmentConstants.thumbnailHeight)
                .overlay(
                    RoundedRectangle(cornerRadius: AttachmentConstants.thumbnailCornerRadius)
                        .stroke(Color.preferredColor(.separator), lineWidth: AttachmentConstants.thumbnailBorderLineWidth)
                )
                .onAppear {
                    self.generateThumbnail(url: configuration.url)
                }
        }
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

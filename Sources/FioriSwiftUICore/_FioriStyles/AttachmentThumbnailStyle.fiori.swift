import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentThumbnailBaseStyle: AttachmentThumbnailStyle {
    @State var image: AnyView?

    @ViewBuilder
    public func makeBody(_ configuration: AttachmentThumbnailConfiguration) -> some View {
        /* configuration.thumbnail?(url: configuration.url) ?? */
        if let image {
            image
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                .frame(width: AttachmentConstants.iconWidth, height: AttachmentConstants.iconHeight)
                .frame(width: AttachmentConstants.cellWidth, height: AttachmentConstants.cellHeight)
                .clipShape(
                    RoundedRectangle(cornerRadius: AttachmentConstants.cellCornerRadius)
                )
        } else {
            AnyView(
                Self.getDefaultThumbnail(url: configuration.url)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                    .foregroundStyle(Color.preferredColor(.tertiaryLabel))
                    .frame(width: AttachmentConstants.iconWidth, height: AttachmentConstants.iconHeight)
                    .frame(width: AttachmentConstants.cellWidth, height: AttachmentConstants.cellHeight)
                    .overlay(
                        RoundedRectangle(cornerRadius: AttachmentConstants.cellCornerRadius)
                            .stroke(Color.preferredColor(.separator), lineWidth: AttachmentConstants.thumbnailBorderLineWidth)
                    )
                    .onAppear {
                        self.generateThumbnail(url: configuration.url)
                    }
            )
        }
    }
}

// Default fiori styles
public struct AttachmentThumbnailFioriStyle: AttachmentThumbnailStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttachmentThumbnailConfiguration) -> some View {
        AttachmentThumbnail(configuration)
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentButtonImageBaseStyle: AttachmentButtonImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttachmentButtonImageConfiguration) -> some View {
        // Add default layout here
        configuration.addButtonImage
    }
}

// Default fiori styles
extension AttachmentButtonImageFioriStyle {
    struct ContentFioriStyle: AttachmentButtonImageStyle {
        func makeBody(_ configuration: AttachmentButtonImageConfiguration) -> some View {
            AttachmentButtonImage(configuration)
                .frame(width: AttachmentConstants.iconWidth, height: AttachmentConstants.iconHeight)
                .foregroundStyle(configuration.controlState == .disabled ? Color.preferredColor(.quaternaryLabel) : Color.preferredColor(.primaryLabel))
                .frame(width: AttachmentConstants.cellWidth, height: AttachmentConstants.cellHeight)
                .background(configuration.controlState == .disabled ? Color.preferredColor(.tertiaryFill) : Color.preferredColor(.quaternaryFill))
                .clipShape(RoundedRectangle(cornerRadius: AttachmentConstants.cellCornerRadius))
        }
    }
}

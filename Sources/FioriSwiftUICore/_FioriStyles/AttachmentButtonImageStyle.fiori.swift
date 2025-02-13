import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.

 1. Uncomment the following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct AttachmentButtonImageBaseStyle: AttachmentButtonImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttachmentButtonImageConfiguration) -> some View {
        // Add default layout here
        configuration.addButtonImage
    }
}

// Default fiori styles
public struct AttachmentButtonImageFioriStyle: AttachmentButtonImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttachmentButtonImageConfiguration) -> some View {
        AttachmentButtonImage(configuration)
            .frame(width: AttachmentConstants.iconWidth, height: AttachmentConstants.iconHeight)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .frame(width: AttachmentConstants.cellWidth, height: AttachmentConstants.cellHeight)
            .background(Color.preferredColor(.tertiaryFill))
            .clipShape(RoundedRectangle(cornerRadius: AttachmentConstants.cellCornerRadius))
    }
}

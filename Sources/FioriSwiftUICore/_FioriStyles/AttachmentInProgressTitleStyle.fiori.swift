import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentInProgressTitleBaseStyle: AttachmentInProgressTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttachmentInProgressTitleConfiguration) -> some View {
        // Add default layout here
        configuration.attachmentInProgressTitle
    }
}

// Default fiori styles
public struct AttachmentInProgressTitleFioriStyle: AttachmentInProgressTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttachmentInProgressTitleConfiguration) -> some View {
        AttachmentInProgressTitle(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}

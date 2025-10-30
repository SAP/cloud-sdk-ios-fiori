import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentErrorTitleBaseStyle: AttachmentErrorTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttachmentErrorTitleConfiguration) -> some View {
        // Add default layout here
        configuration.attachmentErrorTitle
    }
}

// Default fiori styles
public struct AttachmentErrorTitleFioriStyle: AttachmentErrorTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttachmentErrorTitleConfiguration) -> some View {
        AttachmentErrorTitle(configuration)
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentTitleBaseStyle: AttachmentTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttachmentTitleConfiguration) -> some View {
        configuration.attachmentTitle
    }
}

// Default fiori styles
public struct AttachmentTitleFioriStyle: AttachmentTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttachmentTitleConfiguration) -> some View {
        AttachmentTitle(configuration)
    }
}

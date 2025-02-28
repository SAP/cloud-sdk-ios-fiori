import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentSubtitleBaseStyle: AttachmentSubtitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttachmentSubtitleConfiguration) -> some View {
        configuration.subtitle
    }
}

// Default fiori styles
public struct AttachmentSubtitleFioriStyle: AttachmentSubtitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttachmentSubtitleConfiguration) -> some View {
        AttachmentSubtitle(configuration)
    }
}

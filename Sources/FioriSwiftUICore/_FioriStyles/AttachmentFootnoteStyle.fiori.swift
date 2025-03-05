import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttachmentFootnoteBaseStyle: AttachmentFootnoteStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttachmentFootnoteConfiguration) -> some View {
        configuration.attachmentFootnote
    }
}

// Default fiori styles
public struct AttachmentFootnoteFioriStyle: AttachmentFootnoteStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttachmentFootnoteConfiguration) -> some View {
        AttachmentFootnote(configuration)
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct FootnoteIconsTextBaseStyle: FootnoteIconsTextStyle {
    @ViewBuilder
    public func makeBody(_ configuration: FootnoteIconsTextConfiguration) -> some View {
        // Add default layout here
        configuration.footnoteIconsText
    }
}

// Default fiori styles
public struct FootnoteIconsTextFioriStyle: FootnoteIconsTextStyle {
    @ViewBuilder
    public func makeBody(_ configuration: FootnoteIconsTextConfiguration) -> some View {
        FootnoteIconsText(configuration)
    }
}

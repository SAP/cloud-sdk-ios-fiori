import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct PromptBaseStyle: PromptStyle {
    @ViewBuilder
    public func makeBody(_ configuration: PromptConfiguration) -> some View {
        // Add default layout here
        configuration.prompt
    }
}

// Default fiori styles
public struct PromptFioriStyle: PromptStyle {
    @ViewBuilder
    public func makeBody(_ configuration: PromptConfiguration) -> some View {
        Prompt(configuration)
            .font(.fiori(forTextStyle: .footnote))
            .foregroundStyle(Color.preferredColor(.secondaryLabel))
    }
}

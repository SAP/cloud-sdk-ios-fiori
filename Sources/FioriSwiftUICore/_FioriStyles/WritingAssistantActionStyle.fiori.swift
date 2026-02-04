import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct WritingAssistantActionBaseStyle: WritingAssistantActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: WritingAssistantActionConfiguration) -> some View {
        // Add default layout here
        configuration.writingAssistantAction
    }
}

// Default fiori styles
public struct WritingAssistantActionFioriStyle: WritingAssistantActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: WritingAssistantActionConfiguration) -> some View {
        WritingAssistantAction(configuration)
            .fioriButtonStyle(FioriTertiaryButtonStyle())
            .accessibilityElement(children: .combine)
            .accessibilityLabel(NSLocalizedString("AI Writing Assistant", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "AI Writing Assistant"))
            .accessibilityHint(NSLocalizedString("double tap to open AI Writing Assistant and edit text", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "double tap to open AI Writing Assistant and edit text"))
            .accessibilityAddTraits(.isButton)
    }
}

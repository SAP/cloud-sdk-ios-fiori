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
            .fioriButtonStyle(AIWAButtonStyle())
    }
}

struct AIWAButtonStyle: FioriButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.state == .highlighted || configuration.state == .selected
        return configuration.label
            .font(Font.fiori(forTextStyle: .body, weight: .semibold))
            .foregroundColor(.preferredColor(isPressed ? .tintColorTapState : .tintColor))
    }
}

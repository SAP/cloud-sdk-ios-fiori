import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct NotNowActionBaseStyle: NotNowActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: NotNowActionConfiguration) -> some View {
        // Add default layout here
        configuration.notNowAction
    }
}

// Default fiori styles
public struct NotNowActionFioriStyle: NotNowActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: NotNowActionConfiguration) -> some View {
        NotNowAction(configuration)
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AgreeActionBaseStyle: AgreeActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AgreeActionConfiguration) -> some View {
        // Add default layout here
        configuration.agreeAction
    }
}

// Default fiori styles
public struct AgreeActionFioriStyle: AgreeActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AgreeActionConfiguration) -> some View {
        AgreeAction(configuration)
    }
}

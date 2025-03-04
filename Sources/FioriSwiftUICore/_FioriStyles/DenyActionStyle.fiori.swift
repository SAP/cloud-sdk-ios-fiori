import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DenyActionBaseStyle: DenyActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DenyActionConfiguration) -> some View {
        // Add default layout here
        configuration.denyAction
    }
}

// Default fiori styles
public struct DenyActionFioriStyle: DenyActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DenyActionConfiguration) -> some View {
        DenyAction(configuration)
    }
}

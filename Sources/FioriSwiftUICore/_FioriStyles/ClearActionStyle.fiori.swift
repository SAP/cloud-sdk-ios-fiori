import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ClearActionBaseStyle: ClearActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ClearActionConfiguration) -> some View {
        // Add default layout here
        configuration.clearAction
    }
}

// Default fiori styles
public struct ClearActionFioriStyle: ClearActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ClearActionConfiguration) -> some View {
        ClearAction(configuration)
    }
}

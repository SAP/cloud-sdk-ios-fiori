import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct RedoActionBaseStyle: RedoActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: RedoActionConfiguration) -> some View {
        // Add default layout here
        configuration.redoAction
    }
}

// Default fiori styles
public struct RedoActionFioriStyle: RedoActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: RedoActionConfiguration) -> some View {
        RedoAction(configuration)
    }
}

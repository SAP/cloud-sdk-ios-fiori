import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct UndoActionBaseStyle: UndoActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: UndoActionConfiguration) -> some View {
        // Add default layout here
        configuration.undoAction
    }
}

// Default fiori styles
public struct UndoActionFioriStyle: UndoActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: UndoActionConfiguration) -> some View {
        UndoAction(configuration)
    }
}

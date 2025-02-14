import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SaveActionBaseStyle: SaveActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SaveActionConfiguration) -> some View {
        // Add default layout here
        configuration.saveAction
    }
}

// Default fiori styles
public struct SaveActionFioriStyle: SaveActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SaveActionConfiguration) -> some View {
        SaveAction(configuration)
    }
}

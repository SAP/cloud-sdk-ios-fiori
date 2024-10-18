import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SelectAllActionBaseStyle: SelectAllActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SelectAllActionConfiguration) -> some View {
        // Add default layout here
        configuration.selectAllAction
    }
}

// Default fiori styles
public struct SelectAllActionFioriStyle: SelectAllActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SelectAllActionConfiguration) -> some View {
        SelectAllAction(configuration)
    }
}

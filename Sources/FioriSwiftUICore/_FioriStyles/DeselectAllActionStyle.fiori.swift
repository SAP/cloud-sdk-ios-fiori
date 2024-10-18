import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DeselectAllActionBaseStyle: DeselectAllActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DeselectAllActionConfiguration) -> some View {
        // Add default layout here
        configuration.deselectAllAction
    }
}

// Default fiori styles
public struct DeselectAllActionFioriStyle: DeselectAllActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DeselectAllActionConfiguration) -> some View {
        DeselectAllAction(configuration)
    }
}

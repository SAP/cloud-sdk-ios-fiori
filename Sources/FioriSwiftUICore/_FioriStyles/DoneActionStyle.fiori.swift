import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DoneActionBaseStyle: DoneActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DoneActionConfiguration) -> some View {
        // Add default layout here
        configuration.doneAction
    }
}

// Default fiori styles
public struct DoneActionFioriStyle: DoneActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DoneActionConfiguration) -> some View {
        DoneAction(configuration)
    }
}

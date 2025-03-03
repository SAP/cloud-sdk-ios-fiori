import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct NextActionBaseStyle: NextActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: NextActionConfiguration) -> some View {
        // Add default layout here
        configuration.nextAction
    }
}

// Default fiori styles
public struct NextActionFioriStyle: NextActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: NextActionConfiguration) -> some View {
        NextAction(configuration)
    }
}

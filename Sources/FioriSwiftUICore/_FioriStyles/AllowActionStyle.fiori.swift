import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AllowActionBaseStyle: AllowActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AllowActionConfiguration) -> some View {
        // Add default layout here
        configuration.allowAction
    }
}

// Default fiori styles
public struct AllowActionFioriStyle: AllowActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AllowActionConfiguration) -> some View {
        AllowAction(configuration)
    }
}

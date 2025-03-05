import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DisagreeActionBaseStyle: DisagreeActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DisagreeActionConfiguration) -> some View {
        // Add default layout here
        configuration.disagreeAction
    }
}

// Default fiori styles
public struct DisagreeActionFioriStyle: DisagreeActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DisagreeActionConfiguration) -> some View {
        DisagreeAction(configuration)
    }
}

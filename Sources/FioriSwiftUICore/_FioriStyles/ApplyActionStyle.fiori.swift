import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ApplyActionBaseStyle: ApplyActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ApplyActionConfiguration) -> some View {
        configuration.applyAction
    }
}

// Default fiori styles
public struct ApplyActionFioriStyle: ApplyActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ApplyActionConfiguration) -> some View {
        ApplyAction(configuration)
    }
}

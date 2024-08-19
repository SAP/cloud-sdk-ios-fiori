import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SeeAllActionBaseStyle: SeeAllActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SeeAllActionConfiguration) -> some View {
        configuration.seeAllAction
    }
}

// Default fiori styles
public struct SeeAllActionFioriStyle: SeeAllActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SeeAllActionConfiguration) -> some View {
        SeeAllAction(configuration)
    }
}

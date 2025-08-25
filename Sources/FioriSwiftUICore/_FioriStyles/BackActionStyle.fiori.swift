import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct BackActionBaseStyle: BackActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: BackActionConfiguration) -> some View {
        // Add default layout here
        configuration.backAction
    }
}

// Default fiori styles
public struct BackActionFioriStyle: BackActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: BackActionConfiguration) -> some View {
        BackAction(configuration)
            .fioriButtonStyle(FioriNavigationButtonStyle())
    }
}

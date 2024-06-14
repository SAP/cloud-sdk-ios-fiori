import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct CloseActionBaseStyle: CloseActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CloseActionConfiguration) -> some View {
        configuration.closeAction
    }
}

// Default fiori styles
public struct CloseActionFioriStyle: CloseActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CloseActionConfiguration) -> some View {
        CloseAction(configuration)
            .fioriButtonStyle(CloseActionStyle())
    }
    
    struct CloseActionStyle: FioriButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .foregroundStyle(Color.preferredColor(.tertiaryLabel))
        }
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct CancelActionBaseStyle: CancelActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CancelActionConfiguration) -> some View {
        configuration.cancelAction
    }
}

// Default fiori styles
public struct CancelActionFioriStyle: CancelActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CancelActionConfiguration) -> some View {
        CancelAction(configuration)
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ReenterSignatureActionBaseStyle: ReenterSignatureActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ReenterSignatureActionConfiguration) -> some View {
        // Add default layout here
        configuration.reenterSignatureAction
    }
}

// Default fiori styles
public struct ReenterSignatureActionFioriStyle: ReenterSignatureActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ReenterSignatureActionConfiguration) -> some View {
        ReenterSignatureAction(configuration)
    }
}

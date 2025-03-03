import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct StartSignatureActionBaseStyle: StartSignatureActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: StartSignatureActionConfiguration) -> some View {
        // Add default layout here
        configuration.startSignatureAction
    }
}

// Default fiori styles
public struct StartSignatureActionFioriStyle: StartSignatureActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: StartSignatureActionConfiguration) -> some View {
        StartSignatureAction(configuration)
    }
}

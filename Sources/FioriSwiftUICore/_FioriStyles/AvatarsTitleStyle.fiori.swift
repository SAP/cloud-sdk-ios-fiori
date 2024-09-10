import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AvatarsTitleBaseStyle: AvatarsTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AvatarsTitleConfiguration) -> some View {
        // Add default layout here
        configuration.avatarsTitle
    }
}

// Default fiori styles
public struct AvatarsTitleFioriStyle: AvatarsTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AvatarsTitleConfiguration) -> some View {
        AvatarsTitle(configuration)
    }
}

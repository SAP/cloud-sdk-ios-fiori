import FioriMacro
import FioriThemeManager
import Foundation
import SwiftUI

@ComponentStyle
public protocol AvatarsStyle: DynamicProperty {}

public extension AvatarsStyle where Self == AvatarsBaseStyle {
    static var base: AvatarsBaseStyle {
        AvatarsBaseStyle()
    }
}

public extension AvatarsStyle where Self == AvatarsFioriStyle {
    static var fiori: AvatarsFioriStyle {
        AvatarsFioriStyle()
    }
}

// MARK: SDK Developer implementations

// Base Layout style
public struct AvatarsBaseStyle: AvatarsStyle {
    public func makeBody(_ configuration: AvatarsConfiguration) -> some View {
        configuration.avatars
    }
}

// Default fiori styles
public struct AvatarsFioriStyle: AvatarsStyle {
    public func makeBody(_ configuration: AvatarsConfiguration) -> some View {
        Avatars(configuration)
    }
}

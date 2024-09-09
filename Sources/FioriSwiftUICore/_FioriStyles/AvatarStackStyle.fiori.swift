import FioriThemeManager
import Foundation
import SwiftUI

@available(*, deprecated, message: "Use AvatarStack to create an avatar stack. We will remove this model in the future.")
public protocol AvatarStackModel: AvatarsComponent {}

/// :nodoc:
public extension AvatarStack {
    /// Layout for avatars in the stack.
    enum Layout {
        /// Horizontal layout for avatars.
        case horizontal
        /// Grouped layout for avatars.
        case grouped
    }
    
    /// Text position for icons.
    enum TextPosition {
        /// Top position for text.
        case top
        /// Bottom position for text.
        case bottom
        /// Leading position for text.
        case leading
        /// Trailing position for text.
        case trailing
        
        var alignment: Alignment {
            switch self {
            case .top:
                return .top
            case .bottom:
                return .bottom
            case .leading:
                return .leading
            case .trailing:
                return .trailing
            }
        }
    }
}

// Base Layout style
public struct AvatarStackBaseStyle: AvatarStackStyle {
    @Environment(\.avatarsTitlePosition) var titlePosition
    
    public func makeBody(_ configuration: AvatarStackConfiguration) -> some View {
        AvatarsAndTextLayout(textPosition: self.titlePosition) {
            configuration.avatarsTitle
            configuration.avatars
        }
    }
}

// Default fiori styles
extension AvatarStackFioriStyle {
    struct ContentFioriStyle: AvatarStackStyle {
        func makeBody(_ configuration: AvatarStackConfiguration) -> some View {
            AvatarStack(configuration)
        }
    }
    
    struct AvatarsFioriStyle: AvatarsStyle {
        let avatarStackConfiguration: AvatarStackConfiguration
        
        func makeBody(_ configuration: AvatarsConfiguration) -> some View {
            Avatars(configuration)
        }
    }
    
    struct AvatarsTitleFioriStyle: AvatarsTitleStyle {
        let avatarStackConfiguration: AvatarStackConfiguration
        
        func makeBody(_ configuration: AvatarsTitleConfiguration) -> some View {
            AvatarsTitle(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .lineLimit(1)
                .foregroundStyle(Color.preferredColor(.secondaryLabel))
        }
    }
}

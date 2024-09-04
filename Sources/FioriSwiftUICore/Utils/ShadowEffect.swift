import FioriThemeManager
import SwiftUI

/// Fiori style shadow.
public enum FioriShadowStyle: CaseIterable {
    /// Minimal shadow. Most used in banner, header or previews.
    case minimal
    /// Light shadow.
    case light
    /// Medium shadow. Most used in cards or modal views.
    case medium
    /// Heavy shadow. Most used in toast message or quick sort.
    case heavy
    /// Max shadow. Most used in popovers.
    case max
    
    /// Compact shadow. Most used in switch or slider.
    case compact
    /// Broad shadow. Most used in segmented control.
    case broad
}

public extension View {
    /// Apply a shadow with the specified fiori style.
    /// - Parameter style: Shadow style.
    /// - Returns: A new view with the specified shadow style.
    func shadow(_ style: FioriShadowStyle) -> some View {
        self.modifier(FioriShadowModifier(style: style))
    }
}

struct FioriShadowModifier: ViewModifier {
    let style: FioriShadowStyle
    
    let color1 = Color(white: 0, opacity: 0.13)
    let color2 = Color(white: 0, opacity: 0.04)
    let color3 = Color(white: 0, opacity: 0.2)
    
    let color4 = Color(white: 0, opacity: 0.12)
    
    func body(content: Content) -> some View {
        switch self.style {
        case .minimal:
            content
                .shadow(color: self.color1, radius: 1)
        case .light:
            content
                .shadow(color: self.color1, radius: 1)
                .shadow(color: self.color2, radius: 2, y: 1)
        case .medium:
            content
                .shadow(color: self.color1, radius: 1)
                .shadow(color: self.color2, radius: 4, y: 2)
        case .heavy:
            content
                .shadow(color: self.color1, radius: 2)
                .shadow(color: self.color2, radius: 16, y: 8)
                .shadow(color: self.color2, radius: 32, y: 16)
        case .max:
            content
                .shadow(color: self.color2, radius: 1)
                .shadow(color: self.color2, radius: 8, y: 8)
                .shadow(color: self.color3, radius: 50, y: 10)
        case .compact:
            content
                .shadow(color: self.color4, radius: 6.5, y: 6)
                .shadow(color: self.color4, radius: 2, y: 0.5)
        case .broad:
            content
                .shadow(color: self.color2, radius: 0.5, y: 3)
                .shadow(color: self.color4, radius: 4, y: 3)
        }
    }
}

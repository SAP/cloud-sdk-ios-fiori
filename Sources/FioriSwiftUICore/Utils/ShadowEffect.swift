import FioriThemeManager
import SwiftUI

/// Fiori style shadow.
public enum FioriShadowStyle: CaseIterable {
    /// Shadow level 0. Most used in banner, header or previews.
    case level0
    /// Shadow Level 1.
    case level1
    /// Shadow Level 2. Most used in cards or modal views.
    case level2
    /// Shadow Level 3. Most used in toast message or quick sort.
    case level3
    /// Shadow Level 4. Most used in popovers.
    case level4
    
    /// Shadow for small element. Most used in switch or slider.
    case smallElement
    /// Shadow for medium element. Most used in segmented control.
    case mediumElement
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
        case .level0:
            content
                .shadow(color: self.color1, radius: 1)
        case .level1:
            content
                .shadow(color: self.color1, radius: 1)
                .shadow(color: self.color2, radius: 2, y: 1)
        case .level2:
            content
                .shadow(color: self.color1, radius: 1)
                .shadow(color: self.color2, radius: 4, y: 2)
        case .level3:
            content
                .shadow(color: self.color1, radius: 1)
                .shadow(color: self.color2, radius: 16, y: 8)
                .shadow(color: self.color2, radius: 32, y: 16)
        case .level4:
            content
                .shadow(color: self.color2, radius: 1)
                .shadow(color: self.color2, radius: 8, y: 8)
                .shadow(color: self.color3, radius: 50, y: 10)
        case .smallElement:
            content
                .shadow(color: self.color4, radius: 6.5, y: 6)
                .shadow(color: self.color4, radius: 2, y: 0.5)
        case .mediumElement:
            content
                .shadow(color: self.color2, radius: 0.5, y: 3)
                .shadow(color: self.color4, radius: 4, y: 3)
        }
    }
}

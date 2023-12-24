import FioriThemeManager
import Foundation
import SwiftUI

extension SubtitleStyle where Self == SubtitleBaseStyle {
    static var base: SubtitleBaseStyle {
        SubtitleBaseStyle()
    }
}

extension SubtitleStyle where Self == SubtitleFioriStyle {
    static var fiori: some SubtitleStyle {
        SubtitleFioriStyle()
    }
}

// MARK: SDK Developer implementations

// Base Layout style
public struct SubtitleBaseStyle: SubtitleStyle {
    public func makeBody(_ configuration: SubtitleConfiguration) -> some View {
        configuration.subtitle
    }
}

// Default fiori styles
public struct SubtitleFioriStyle: SubtitleStyle {
    public func makeBody(_ configuration: SubtitleConfiguration) -> some View {
        Subtitle(configuration)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .font(.subheadline)
    }
}

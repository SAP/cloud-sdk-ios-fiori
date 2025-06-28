import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct SubtitleBaseStyle: SubtitleStyle {
    public func makeBody(_ configuration: SubtitleConfiguration) -> some View {
        configuration.subtitle
    }
}

// Default fiori styles
public struct SubtitleFioriStyle: SubtitleStyle {
    @Environment(\.isLoading) var isLoading
    public func makeBody(_ configuration: SubtitleConfiguration) -> some View {
        Subtitle(configuration)
            .foregroundStyle(Color.preferredColor(self.isLoading ? .separator : .primaryLabel))
            .font(.fiori(forTextStyle: .body))
    }
}

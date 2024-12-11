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
    public func makeBody(_ configuration: SubtitleConfiguration) -> some View {
        Subtitle(configuration)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .font(.fiori(forTextStyle: .body))
    }
}

// Default nss styles
public struct SubtitleNSSStyle: SubtitleStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: SubtitleConfiguration) -> some View {
        Subtitle(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.subtitleIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

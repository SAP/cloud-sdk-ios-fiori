import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment the following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct PlaceholderBaseStyle: PlaceholderStyle {
    @ViewBuilder
    public func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
        configuration.placeholder
    }
}

// Default fiori styles
public struct PlaceholderFioriStyle: PlaceholderStyle {
    @ViewBuilder
    public func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
        Placeholder(configuration)
            .foregroundStyle(Color.preferredColor(.tertiaryLabel))
            .font(.fiori(forTextStyle: .body).italic())
    }
}

// Default nss styles
public struct PlaceholderNSSStyle: PlaceholderStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
        Placeholder(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.placeholderIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

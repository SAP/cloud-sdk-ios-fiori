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
public struct Row1BaseStyle: Row1Style {
    @ViewBuilder
    public func makeBody(_ configuration: Row1Configuration) -> some View {
        // Add default layout here
        configuration.row1
    }
}

// Default fiori styles
public struct Row1FioriStyle: Row1Style {
    @ViewBuilder
    public func makeBody(_ configuration: Row1Configuration) -> some View {
        Row1(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}

// Default nss styles
public struct Row1NSSStyle: Row1Style {
    var data: NSSStyleData

    public func makeBody(_ configuration: Row1Configuration) -> some View {
        Row1(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.row1Identifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

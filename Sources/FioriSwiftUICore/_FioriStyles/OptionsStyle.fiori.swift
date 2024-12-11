import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// **
// This file provides default fiori style for the component.
//
// 1. Uncomment the following code.
// 2. Implement layout and style in corresponding places.
// 3. Delete `.generated` from file name.
// 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
// */

// Base Layout style
public struct OptionsBaseStyle: OptionsStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OptionsConfiguration) -> some View {
        // Add default layout here
    }
}

// Default fiori styles
public struct OptionsFioriStyle: OptionsStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OptionsConfiguration) -> some View {
        Options(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(.pink5))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}

// Default nss styles
public struct OptionsNSSStyle: OptionsStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: OptionsConfiguration) -> some View {
        Options(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.optionsIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
public struct LowerThumbBaseStyle: LowerThumbStyle {
    @ViewBuilder
    public func makeBody(_ configuration: LowerThumbConfiguration) -> some View {
        // Add default layout here
        configuration.lowerThumb
    }
}

// Default fiori styles
public struct LowerThumbFioriStyle: LowerThumbStyle {
    @ViewBuilder
    public func makeBody(_ configuration: LowerThumbConfiguration) -> some View {
        LowerThumb(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}

// Default nss styles
public struct LowerThumbNSSStyle: LowerThumbStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: LowerThumbConfiguration) -> some View {
        LowerThumb(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.lowerThumbIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

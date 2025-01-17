import FioriThemeManager

// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
public struct HeaderActionBaseStyle: HeaderActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: HeaderActionConfiguration) -> some View {
        // Add default layout here
        configuration.headerAction
    }
}

// Default fiori styles
public struct HeaderActionFioriStyle: HeaderActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: HeaderActionConfiguration) -> some View {
        HeaderAction(configuration)
            .fioriButtonStyle(FioriTertiaryButtonStyle())
    }
}

// Default nss styles
public struct HeaderActionNSSStyle: HeaderActionStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: HeaderActionConfiguration) -> some View {
        HeaderAction(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.headerActionIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

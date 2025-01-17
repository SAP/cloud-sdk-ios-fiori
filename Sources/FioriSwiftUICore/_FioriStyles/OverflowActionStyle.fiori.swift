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
public struct OverflowActionBaseStyle: OverflowActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OverflowActionConfiguration) -> some View {
        // Add default layout here
        configuration.overflowAction
    }
}

// Default fiori styles
public struct OverflowActionFioriStyle: OverflowActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OverflowActionConfiguration) -> some View {
        OverflowAction(configuration)
            .fioriButtonStyle(FioriTertiaryButtonStyle())
    }
}

// Default nss styles
public struct OverflowActionNSSStyle: OverflowActionStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: OverflowActionConfiguration) -> some View {
        OverflowAction(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.overflowActionIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

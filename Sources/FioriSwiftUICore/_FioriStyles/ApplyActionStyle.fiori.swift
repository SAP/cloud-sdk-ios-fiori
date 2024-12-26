import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ApplyActionBaseStyle: ApplyActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ApplyActionConfiguration) -> some View {
        configuration.applyAction
    }
}

// Default fiori styles
public struct ApplyActionFioriStyle: ApplyActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ApplyActionConfiguration) -> some View {
        ApplyAction(configuration)
    }
}

// Default nss styles
public struct ApplyActionNSSStyle: ApplyActionStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ApplyActionConfiguration) -> some View {
        ApplyAction(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.applyActionIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

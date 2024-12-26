import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DeselectAllActionBaseStyle: DeselectAllActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DeselectAllActionConfiguration) -> some View {
        // Add default layout here
        configuration.deselectAllAction
    }
}

// Default fiori styles
public struct DeselectAllActionFioriStyle: DeselectAllActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DeselectAllActionConfiguration) -> some View {
        DeselectAllAction(configuration)
    }
}

// Default nss styles
public struct DeselectAllActionNSSStyle: DeselectAllActionStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: DeselectAllActionConfiguration) -> some View {
        DeselectAllAction(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.deselectAllActionIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

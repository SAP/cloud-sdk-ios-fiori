import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SelectAllActionBaseStyle: SelectAllActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SelectAllActionConfiguration) -> some View {
        // Add default layout here
        configuration.selectAllAction
    }
}

// Default fiori styles
public struct SelectAllActionFioriStyle: SelectAllActionStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SelectAllActionConfiguration) -> some View {
        SelectAllAction(configuration)
    }
}

// Default nss styles
public struct SelectAllActionNSSStyle: SelectAllActionStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: SelectAllActionConfiguration) -> some View {
        SelectAllAction(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.selectAllActionIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

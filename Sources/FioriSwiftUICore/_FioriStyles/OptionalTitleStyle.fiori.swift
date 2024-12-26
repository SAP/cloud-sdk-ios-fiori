import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct OptionalTitleBaseStyle: OptionalTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OptionalTitleConfiguration) -> some View {
        configuration.optionalTitle
    }
}

// Default fiori styles
public struct OptionalTitleFioriStyle: OptionalTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OptionalTitleConfiguration) -> some View {
        OptionalTitle(configuration)
    }
}

// Default nss styles
public struct OptionalTitleNSSStyle: OptionalTitleStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: OptionalTitleConfiguration) -> some View {
        OptionalTitle(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.optionalTitleIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

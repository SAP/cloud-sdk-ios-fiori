import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct IconBaseStyle: IconStyle {
    @ViewBuilder
    public func makeBody(_ configuration: IconConfiguration) -> some View {
        configuration.icon
    }
}

// Default fiori styles
public struct IconFioriStyle: IconStyle {
    @ViewBuilder
    public func makeBody(_ configuration: IconConfiguration) -> some View {
        Icon(configuration)
    }
}

// Default nss styles
public struct IconNSSStyle: IconStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: IconConfiguration) -> some View {
        Icon(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.iconIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

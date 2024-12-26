import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SubAttributeBaseStyle: SubAttributeStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SubAttributeConfiguration) -> some View {
        configuration.subAttribute
    }
}

// Default fiori styles
public struct SubAttributeFioriStyle: SubAttributeStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SubAttributeConfiguration) -> some View {
        SubAttribute(configuration)
    }
}

// Default nss styles
public struct SubAttributeNSSStyle: SubAttributeStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: SubAttributeConfiguration) -> some View {
        SubAttribute(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.subAttributeIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

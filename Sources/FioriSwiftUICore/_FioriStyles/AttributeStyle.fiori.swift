import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AttributeBaseStyle: AttributeStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttributeConfiguration) -> some View {
        configuration.attribute
    }
}

// Default fiori styles
public struct AttributeFioriStyle: AttributeStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AttributeConfiguration) -> some View {
        Attribute(configuration)
    }
}

// Default nss styles
public struct AttributeNSSStyle: AttributeStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: AttributeConfiguration) -> some View {
        Attribute(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.attributeIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

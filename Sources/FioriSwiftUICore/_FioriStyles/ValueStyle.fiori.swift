import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ValueBaseStyle: ValueStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ValueConfiguration) -> some View {
        configuration.value
    }
}

// Default fiori styles
public struct ValueFioriStyle: ValueStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ValueConfiguration) -> some View {
        Value(configuration)
    }
}

// Default nss styles
public struct ValueNSSStyle: ValueStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ValueConfiguration) -> some View {
        Value(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.valueIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

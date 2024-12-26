import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ValueLabelBaseStyle: ValueLabelStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
        configuration.valueLabel
    }
}

// Default fiori styles
public struct ValueLabelFioriStyle: ValueLabelStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
        ValueLabel(configuration)
    }
}

// Default nss styles
public struct ValueLabelNSSStyle: ValueLabelStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ValueLabelConfiguration) -> some View {
        ValueLabel(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.valueLabelIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

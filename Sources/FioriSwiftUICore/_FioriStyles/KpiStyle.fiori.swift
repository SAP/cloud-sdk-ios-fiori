import FioriThemeManager

// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct KpiBaseStyle: KpiStyle {
    @ViewBuilder
    public func makeBody(_ configuration: KpiConfiguration) -> some View {
        // Add default layout here
        configuration.kpi
    }
}

// Default fiori styles
public struct KpiFioriStyle: KpiStyle {
    @ViewBuilder
    public func makeBody(_ configuration: KpiConfiguration) -> some View {
        Kpi(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}

// Default nss styles
public struct KpiNSSStyle: KpiStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: KpiConfiguration) -> some View {
        Kpi(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.kpiIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

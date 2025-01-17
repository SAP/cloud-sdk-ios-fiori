import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct KPIContentBaseStyle: KPIContentStyle {
    @ViewBuilder
    public func makeBody(_ configuration: KPIContentConfiguration) -> some View {
        // Add default layout here
        configuration.kPIContent
    }
}

// Default fiori styles
public struct KPIContentFioriStyle: KPIContentStyle {
    @ViewBuilder
    public func makeBody(_ configuration: KPIContentConfiguration) -> some View {
        KPIContent(configuration)
    }
}

// Default nss styles
public struct KPIContentNSSStyle: KPIContentStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: KPIContentConfiguration) -> some View {
        KPIContent(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.kPIContentIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

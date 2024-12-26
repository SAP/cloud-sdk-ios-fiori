import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct AllEntriesSectionTitleBaseStyle: AllEntriesSectionTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AllEntriesSectionTitleConfiguration) -> some View {
        // Add default layout here
        configuration.allEntriesSectionTitle
    }
}

// Default fiori styles
public struct AllEntriesSectionTitleFioriStyle: AllEntriesSectionTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: AllEntriesSectionTitleConfiguration) -> some View {
        AllEntriesSectionTitle(configuration)
    }
}

// Default nss styles
public struct AllEntriesSectionTitleNSSStyle: AllEntriesSectionTitleStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: AllEntriesSectionTitleConfiguration) -> some View {
        AllEntriesSectionTitle(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.allEntriesSectionTitleIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

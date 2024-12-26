import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SelectedEntriesSectionTitleBaseStyle: SelectedEntriesSectionTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SelectedEntriesSectionTitleConfiguration) -> some View {
        // Add default layout here
        configuration.selectedEntriesSectionTitle
    }
}

// Default fiori styles
public struct SelectedEntriesSectionTitleFioriStyle: SelectedEntriesSectionTitleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SelectedEntriesSectionTitleConfiguration) -> some View {
        SelectedEntriesSectionTitle(configuration)
    }
}

// Default nss styles
public struct SelectedEntriesSectionTitleNSSStyle: SelectedEntriesSectionTitleStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: SelectedEntriesSectionTitleConfiguration) -> some View {
        SelectedEntriesSectionTitle(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.selectedEntriesSectionTitleIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

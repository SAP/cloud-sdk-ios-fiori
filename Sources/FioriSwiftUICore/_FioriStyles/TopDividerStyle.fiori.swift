import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TopDividerBaseStyle: TopDividerStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TopDividerConfiguration) -> some View {
        configuration.topDivider
    }
}

// Default fiori styles
public struct TopDividerFioriStyle: TopDividerStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TopDividerConfiguration) -> some View {
        TopDivider(configuration)
    }
}

// Default nss styles
public struct TopDividerNSSStyle: TopDividerStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: TopDividerConfiguration) -> some View {
        TopDivider(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.topDividerIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

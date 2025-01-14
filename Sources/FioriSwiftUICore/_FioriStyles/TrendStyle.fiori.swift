import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TrendBaseStyle: TrendStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TrendConfiguration) -> some View {
        // Add default layout here
        configuration.trend
    }
}

// Default fiori styles
public struct TrendFioriStyle: TrendStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TrendConfiguration) -> some View {
        Trend(configuration)
    }
}

// Default nss styles
public struct TrendNSSStyle: TrendStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: TrendConfiguration) -> some View {
        Trend(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.trendIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

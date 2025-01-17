import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TrendImageBaseStyle: TrendImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TrendImageConfiguration) -> some View {
        // Add default layout here
        configuration.trendImage
    }
}

// Default fiori styles
public struct TrendImageFioriStyle: TrendImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TrendImageConfiguration) -> some View {
        TrendImage(configuration)
    }
}

// Default nss styles
public struct TrendImageNSSStyle: TrendImageStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: TrendImageConfiguration) -> some View {
        TrendImage(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.trendImageIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

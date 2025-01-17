import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct OuterCircleBaseStyle: OuterCircleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OuterCircleConfiguration) -> some View {
        // Add default layout here
        configuration.outerCircle
    }
}

// Default fiori styles
public struct OuterCircleFioriStyle: OuterCircleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OuterCircleConfiguration) -> some View {
        OuterCircle(configuration)
    }
}

// Default nss styles
public struct OuterCircleNSSStyle: OuterCircleStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: OuterCircleConfiguration) -> some View {
        OuterCircle(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.outerCircleIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct LineBaseStyle: LineStyle {
    @ViewBuilder
    public func makeBody(_ configuration: LineConfiguration) -> some View {
        // Add default layout here
        configuration.line
    }
}

// Default fiori styles
public struct LineFioriStyle: LineStyle {
    @ViewBuilder
    public func makeBody(_ configuration: LineConfiguration) -> some View {
        Line(configuration)
    }
}

// Default nss styles
public struct LineNSSStyle: LineStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: LineConfiguration) -> some View {
        Line(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.lineIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

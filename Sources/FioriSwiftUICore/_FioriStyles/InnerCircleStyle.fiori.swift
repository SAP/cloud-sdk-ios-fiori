import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct InnerCircleBaseStyle: InnerCircleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: InnerCircleConfiguration) -> some View {
        // Add default layout here
        configuration.innerCircle
    }
}

// Default fiori styles
public struct InnerCircleFioriStyle: InnerCircleStyle {
    @ViewBuilder
    public func makeBody(_ configuration: InnerCircleConfiguration) -> some View {
        InnerCircle(configuration)
    }
}

// Default nss styles
public struct InnerCircleNSSStyle: InnerCircleStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: InnerCircleConfiguration) -> some View {
        InnerCircle(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.innerCircleIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

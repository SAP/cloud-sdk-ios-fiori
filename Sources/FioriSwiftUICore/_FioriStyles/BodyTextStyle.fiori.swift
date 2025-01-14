import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct BodyTextBaseStyle: BodyTextStyle {
    @ViewBuilder
    public func makeBody(_ configuration: BodyTextConfiguration) -> some View {
        configuration.bodyText
    }
}

// Default fiori styles
public struct BodyTextFioriStyle: BodyTextStyle {
    @ViewBuilder
    public func makeBody(_ configuration: BodyTextConfiguration) -> some View {
        BodyText(configuration)
    }
}

// Default nss styles
public struct BodyTextNSSStyle: BodyTextStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: BodyTextConfiguration) -> some View {
        BodyText(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.bodyTextIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

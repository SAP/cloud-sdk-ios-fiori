import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DescriptionTextBaseStyle: DescriptionTextStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DescriptionTextConfiguration) -> some View {
        // Add default layout here
        configuration.descriptionText
    }
}

// Default fiori styles
public struct DescriptionTextFioriStyle: DescriptionTextStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DescriptionTextConfiguration) -> some View {
        DescriptionText(configuration)
    }
}

// Default nss styles
public struct DescriptionTextNSSStyle: DescriptionTextStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: DescriptionTextConfiguration) -> some View {
        DescriptionText(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.descriptionTextIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

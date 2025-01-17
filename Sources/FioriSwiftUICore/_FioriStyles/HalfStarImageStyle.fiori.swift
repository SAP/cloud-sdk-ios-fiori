import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct HalfStarImageBaseStyle: HalfStarImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: HalfStarImageConfiguration) -> some View {
        // Add default layout here
        configuration.halfStarImage
    }
}

// Default fiori styles
public struct HalfStarImageFioriStyle: HalfStarImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: HalfStarImageConfiguration) -> some View {
        HalfStarImage(configuration)
    }
}

// Default nss styles
public struct HalfStarImageNSSStyle: HalfStarImageStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: HalfStarImageConfiguration) -> some View {
        HalfStarImage(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.halfStarImageIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

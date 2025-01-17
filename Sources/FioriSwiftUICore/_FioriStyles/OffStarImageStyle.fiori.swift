import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct OffStarImageBaseStyle: OffStarImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OffStarImageConfiguration) -> some View {
        // Add default layout here
        configuration.offStarImage
    }
}

// Default fiori styles
public struct OffStarImageFioriStyle: OffStarImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OffStarImageConfiguration) -> some View {
        OffStarImage(configuration)
    }
}

// Default nss styles
public struct OffStarImageNSSStyle: OffStarImageStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: OffStarImageConfiguration) -> some View {
        OffStarImage(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.offStarImageIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

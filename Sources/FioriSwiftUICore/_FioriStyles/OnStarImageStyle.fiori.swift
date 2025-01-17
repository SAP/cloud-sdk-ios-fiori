import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct OnStarImageBaseStyle: OnStarImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OnStarImageConfiguration) -> some View {
        // Add default layout here
        configuration.onStarImage
    }
}

// Default fiori styles
public struct OnStarImageFioriStyle: OnStarImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: OnStarImageConfiguration) -> some View {
        OnStarImage(configuration)
    }
}

// Default nss styles
public struct OnStarImageNSSStyle: OnStarImageStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: OnStarImageConfiguration) -> some View {
        OnStarImage(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.onStarImageIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

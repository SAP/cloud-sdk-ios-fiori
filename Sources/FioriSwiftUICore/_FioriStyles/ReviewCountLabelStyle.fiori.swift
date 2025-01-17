import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ReviewCountLabelBaseStyle: ReviewCountLabelStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ReviewCountLabelConfiguration) -> some View {
        // Add default layout here
        configuration.reviewCountLabel
    }
}

// Default fiori styles
public struct ReviewCountLabelFioriStyle: ReviewCountLabelStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ReviewCountLabelConfiguration) -> some View {
        ReviewCountLabel(configuration)
    }
}

// Default nss styles
public struct ReviewCountLabelNSSStyle: ReviewCountLabelStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ReviewCountLabelConfiguration) -> some View {
        ReviewCountLabel(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.reviewCountLabelIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

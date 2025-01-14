import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DetailContentBaseStyle: DetailContentStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DetailContentConfiguration) -> some View {
        configuration.detailContent
    }
}

// Default fiori styles
public struct DetailContentFioriStyle: DetailContentStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DetailContentConfiguration) -> some View {
        DetailContent(configuration)
    }
}

// Default nss styles
public struct DetailContentNSSStyle: DetailContentStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: DetailContentConfiguration) -> some View {
        DetailContent(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.detailContentIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

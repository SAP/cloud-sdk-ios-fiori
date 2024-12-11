import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct FootnoteIconsTextBaseStyle: FootnoteIconsTextStyle {
    @ViewBuilder
    public func makeBody(_ configuration: FootnoteIconsTextConfiguration) -> some View {
        // Add default layout here
        configuration.footnoteIconsText
    }
}

// Default fiori styles
public struct FootnoteIconsTextFioriStyle: FootnoteIconsTextStyle {
    @ViewBuilder
    public func makeBody(_ configuration: FootnoteIconsTextConfiguration) -> some View {
        FootnoteIconsText(configuration)
    }
}

// Default nss styles
public struct FootnoteIconsTextNSSStyle: FootnoteIconsTextStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: FootnoteIconsTextConfiguration) -> some View {
        FootnoteIconsText(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.footnoteIconsTextIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

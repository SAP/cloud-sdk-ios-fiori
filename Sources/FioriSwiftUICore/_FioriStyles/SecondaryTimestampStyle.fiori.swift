import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SecondaryTimestampBaseStyle: SecondaryTimestampStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SecondaryTimestampConfiguration) -> some View {
        configuration.secondaryTimestamp
    }
}

// Default fiori styles
public struct SecondaryTimestampFioriStyle: SecondaryTimestampStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SecondaryTimestampConfiguration) -> some View {
        SecondaryTimestamp(configuration)
    }
}

// Default nss styles
public struct SecondaryTimestampNSSStyle: SecondaryTimestampStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: SecondaryTimestampConfiguration) -> some View {
        SecondaryTimestamp(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.secondaryTimestampIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

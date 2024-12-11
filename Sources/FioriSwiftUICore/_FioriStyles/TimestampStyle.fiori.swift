import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimestampBaseStyle: TimestampStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TimestampConfiguration) -> some View {
        configuration.timestamp
    }
}

// Default fiori styles
public struct TimestampFioriStyle: TimestampStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TimestampConfiguration) -> some View {
        Timestamp(configuration)
    }
}

// Default nss styles
public struct TimestampNSSStyle: TimestampStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: TimestampConfiguration) -> some View {
        Timestamp(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.timestampIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct CounterBaseStyle: CounterStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CounterConfiguration) -> some View {
        // Add default layout here
        configuration.counter
    }
}

// Default fiori styles
public struct CounterFioriStyle: CounterStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CounterConfiguration) -> some View {
        Counter(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}

// Default nss styles
public struct CounterNSSStyle: CounterStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: CounterConfiguration) -> some View {
        Counter(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.counterIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

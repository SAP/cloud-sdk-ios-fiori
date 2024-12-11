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
public struct CardBodyBaseStyle: CardBodyStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CardBodyConfiguration) -> some View {
        // Add default layout here
        configuration.cardBody
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// Default fiori styles
public struct CardBodyFioriStyle: CardBodyStyle {
    @ViewBuilder
    public func makeBody(_ configuration: CardBodyConfiguration) -> some View {
        CardBody(configuration)
        // Add default style here
        // .foregroundStyle(Color.preferredColor(<#fiori color#>))
        // .font(.fiori(forTextStyle: <#fiori font#>))
    }
}

// Default nss styles
public struct CardBodyNSSStyle: CardBodyStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: CardBodyConfiguration) -> some View {
        CardBody(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.cardBodyIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

#Preview {
    CardBody {
        Text("Card Body Placeholder")
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct MandatoryFieldIndicatorBaseStyle: MandatoryFieldIndicatorStyle {
    @ViewBuilder
    public func makeBody(_ configuration: MandatoryFieldIndicatorConfiguration) -> some View {
        // Add default layout here
        configuration.mandatoryFieldIndicator
    }
}

// Default fiori styles
public struct MandatoryFieldIndicatorFioriStyle: MandatoryFieldIndicatorStyle {
    @ViewBuilder
    public func makeBody(_ configuration: MandatoryFieldIndicatorConfiguration) -> some View {
        MandatoryFieldIndicator(configuration)
            // Add default style here
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .font(.fiori(forTextStyle: .subheadline, weight: .semibold))
            .accessibilityLabel(NSLocalizedString("Required Field", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Required Field"))
    }
}

// Default nss styles
public struct MandatoryFieldIndicatorNSSStyle: MandatoryFieldIndicatorStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: MandatoryFieldIndicatorConfiguration) -> some View {
        MandatoryFieldIndicator(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.mandatoryFieldIndicatorIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

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

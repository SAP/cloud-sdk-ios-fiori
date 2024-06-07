import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct MandatoryIndicatorBaseStyle: MandatoryIndicatorStyle {
    @ViewBuilder
    public func makeBody(_ configuration: MandatoryIndicatorConfiguration) -> some View {
        // Add default layout here
        configuration.mandatoryIndicator
    }
}

// Default fiori styles
public struct MandatoryIndicatorFioriStyle: MandatoryIndicatorStyle {
    @ViewBuilder
    public func makeBody(_ configuration: MandatoryIndicatorConfiguration) -> some View {
        MandatoryIndicator(configuration)
            // Add default style here
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .font(.fiori(forTextStyle: .headline))
    }
}

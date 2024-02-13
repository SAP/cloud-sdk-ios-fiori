import Foundation
import SwiftUI
import FioriThemeManager

// Base Layout style
public struct InformationViewIconBaseStyle: InformationViewIconStyle {
    public func makeBody(_ configuration: InformationViewIconConfiguration) -> some View {
        // Add default layout here
        configuration.informationViewIcon
    }
}

// Default fiori styles
public struct InformationViewIconFioriStyle: InformationViewIconStyle {
    public func makeBody(_ configuration: InformationViewIconConfiguration) -> some View {
        InformationViewIcon(configuration)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .font(.fiori(forTextStyle: .footnote))
    }
}

import Foundation
import SwiftUI
import FioriThemeManager

// Base Layout style
public struct InformationViewTextBaseStyle: InformationViewTextStyle {
    public func makeBody(_ configuration: InformationViewTextConfiguration) -> some View {
        // Add default layout here
        configuration.informationViewText
    }
}

// Default fiori styles
public struct InformationViewTextFioriStyle: InformationViewTextStyle {
    public func makeBody(_ configuration: InformationViewTextConfiguration) -> some View {
        InformationViewText(configuration)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .font(.fiori(forTextStyle: .footnote))
    }
}

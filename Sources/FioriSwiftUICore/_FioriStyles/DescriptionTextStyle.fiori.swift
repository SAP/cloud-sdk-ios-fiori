import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct DescriptionTextBaseStyle: DescriptionTextStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DescriptionTextConfiguration) -> some View {
        // Add default layout here
        configuration.descriptionText
    }
}

// Default fiori styles
public struct DescriptionTextFioriStyle: DescriptionTextStyle {
    @ViewBuilder
    public func makeBody(_ configuration: DescriptionTextConfiguration) -> some View {
        DescriptionText(configuration)
    }
}

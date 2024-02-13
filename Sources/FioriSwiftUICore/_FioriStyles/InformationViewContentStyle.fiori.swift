import Foundation
import SwiftUI
import FioriThemeManager

// Base Layout style
public struct InformationViewContentBaseStyle: InformationViewContentStyle {
    public func makeBody(_ configuration: InformationViewContentConfiguration) -> some View {
        // Add default layout here
        configuration.informationViewContent
    }
}

// Default fiori styles
public struct InformationViewContentFioriStyle: InformationViewContentStyle {
    public func makeBody(_ configuration: InformationViewContentConfiguration) -> some View {
        InformationViewContent(configuration)
            // Add default style here
            //.foregroundStyle(Color.preferredColor(<#fiori color#>))
            //.font(.fiori(forTextStyle: <#fiori font#>))
    }
}

import Foundation
import SwiftUI
import FioriThemeManager

// Base Layout style
public struct InformationViewContentBaseStyle: InformationViewContentStyle {
    public func makeBody(_ configuration: InformationViewContentConfiguration) -> some View {
        configuration.informationViewContent
    }
}

// Default fiori styles
public struct InformationViewContentFioriStyle: InformationViewContentStyle {
    public func makeBody(_ configuration: InformationViewContentConfiguration) -> some View {
        InformationViewContent(configuration)
    }
}

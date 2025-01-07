import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct KPIContentBaseStyle: KPIContentStyle {
    @ViewBuilder
    public func makeBody(_ configuration: KPIContentConfiguration) -> some View {
        // Add default layout here
        configuration.kPIContent
    }
}

// Default fiori styles
public struct KPIContentFioriStyle: KPIContentStyle {
    @ViewBuilder
    public func makeBody(_ configuration: KPIContentConfiguration) -> some View {
        KPIContent(configuration)
    }
}

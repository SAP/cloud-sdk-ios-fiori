import FioriThemeManager
import Foundation
import SwiftUI

public struct KPISubItemBaseStyle: KPISubItemStyle {
    @ViewBuilder
    public func makeBody(_ configuration: KPISubItemConfiguration) -> some View {
        // Add default layout here
        configuration.kPISubItemValue
    }
}

// Default fiori styles
public struct KPISubItemFioriStyle: KPISubItemStyle {
    @ViewBuilder
    public func makeBody(_ configuration: KPISubItemConfiguration) -> some View {
        KPISubItem(configuration)
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

public struct KPIViewSubItemBaseStyle: KPIViewSubItemStyle {
    @ViewBuilder
    public func makeBody(_ configuration: KPIViewSubItemConfiguration) -> some View {
        // Add default layout here
        configuration.kPIViewSubItemValue
    }
}

// Default fiori styles
public struct KPIViewSubItemFioriStyle: KPIViewSubItemStyle {
    @ViewBuilder
    public func makeBody(_ configuration: KPIViewSubItemConfiguration) -> some View {
        KPIViewSubItem(configuration)
    }
}

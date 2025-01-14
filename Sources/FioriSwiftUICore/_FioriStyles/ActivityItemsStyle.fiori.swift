import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ActivityItemsBaseStyle: ActivityItemsStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ActivityItemsConfiguration) -> some View {
        // Add default layout here
        configuration.activityItems
    }
}

// Default fiori styles
public struct ActivityItemsFioriStyle: ActivityItemsStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ActivityItemsConfiguration) -> some View {
        ActivityItems(configuration)
            .font(.fiori(forTextStyle: .body).weight(.light))
            .foregroundColor(.preferredColor(.tintColor))
    }
}

// Default nss styles
public struct ActivityItemsNSSStyle: ActivityItemsStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ActivityItemsConfiguration) -> some View {
        ActivityItems(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.activityItemsIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

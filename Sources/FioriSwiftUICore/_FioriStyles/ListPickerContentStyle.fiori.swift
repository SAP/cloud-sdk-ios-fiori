import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct ListPickerContentBaseStyle: ListPickerContentStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ListPickerContentConfiguration) -> some View {
        // Add default layout here
        configuration.listPickerContent
    }
}

// Default fiori styles
public struct ListPickerContentFioriStyle: ListPickerContentStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ListPickerContentConfiguration) -> some View {
        ListPickerContent(configuration)
    }
}

// Default nss styles
public struct ListPickerContentNSSStyle: ListPickerContentStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: ListPickerContentConfiguration) -> some View {
        ListPickerContent(configuration)
            .modifier(NSSStyleModifier<NSSBaseStyleType>(styles: self.data.value(configuration.listPickerContentIdentifier)))
        // Add custom nss style for its content
        // .modifier(NSSStyleModifier<<#T: NSSCovert & RawRepresentable#>>(styles: <#T##NSSStyleData#>)
    }
}

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

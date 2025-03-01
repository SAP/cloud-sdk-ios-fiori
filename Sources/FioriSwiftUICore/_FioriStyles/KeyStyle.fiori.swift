import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct KeyBaseStyle: KeyStyle {
    @ViewBuilder
    public func makeBody(_ configuration: KeyConfiguration) -> some View {
        configuration.key
    }
}

// Default fiori styles
public struct KeyFioriStyle: KeyStyle {
    @ViewBuilder
    public func makeBody(_ configuration: KeyConfiguration) -> some View {
        Key(configuration)
    }
}

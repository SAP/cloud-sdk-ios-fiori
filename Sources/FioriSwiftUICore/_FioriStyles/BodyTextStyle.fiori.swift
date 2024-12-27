import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct BodyTextBaseStyle: BodyTextStyle {
    @ViewBuilder
    public func makeBody(_ configuration: BodyTextConfiguration) -> some View {
        configuration.bodyText
    }
}

// Default fiori styles
public struct BodyTextFioriStyle: BodyTextStyle {
    @ViewBuilder
    public func makeBody(_ configuration: BodyTextConfiguration) -> some View {
        BodyText(configuration)
    }
}

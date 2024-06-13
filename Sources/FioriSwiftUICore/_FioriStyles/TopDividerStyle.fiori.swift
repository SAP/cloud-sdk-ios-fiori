import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TopDividerBaseStyle: TopDividerStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TopDividerConfiguration) -> some View {
        configuration.topDivider
    }
}

// Default fiori styles
public struct TopDividerFioriStyle: TopDividerStyle {
    @ViewBuilder
    public func makeBody(_ configuration: TopDividerConfiguration) -> some View {
        TopDivider(configuration)
    }
}

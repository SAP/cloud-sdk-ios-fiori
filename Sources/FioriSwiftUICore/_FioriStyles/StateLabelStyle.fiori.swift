import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// Base Layout style
public struct StateLabelBaseStyle: StateLabelStyle {
    @ViewBuilder
    public func makeBody(_ configuration: StateLabelConfiguration) -> some View {
        // Add default layout here
        configuration.stateLabel
    }
}

// Default fiori styles
public struct StateLabelFioriStyle: StateLabelStyle {
    @ViewBuilder
    public func makeBody(_ configuration: StateLabelConfiguration) -> some View {
        StateLabel(configuration)
    }
}

import FioriThemeManager

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

// Base Layout style
public struct ProgressIndicatorProtocolBaseStyle: ProgressIndicatorProtocolStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ProgressIndicatorProtocolConfiguration) -> some View {}
}

// Default fiori styles
public struct ProgressIndicatorProtocolFioriStyle: ProgressIndicatorProtocolStyle {
    @ViewBuilder
    public func makeBody(_ configuration: ProgressIndicatorProtocolConfiguration) -> some View {
        ProgressIndicatorProtocol(configuration)
    }
}

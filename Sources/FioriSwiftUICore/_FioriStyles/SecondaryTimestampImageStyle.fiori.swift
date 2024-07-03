import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct SecondaryTimestampImageBaseStyle: SecondaryTimestampImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SecondaryTimestampImageConfiguration) -> some View {
        configuration.secondaryTimestampImage
    }
}

// Default fiori styles
public struct SecondaryTimestampImageFioriStyle: SecondaryTimestampImageStyle {
    @ViewBuilder
    public func makeBody(_ configuration: SecondaryTimestampImageConfiguration) -> some View {
        SecondaryTimestampImage(configuration)
    }
}

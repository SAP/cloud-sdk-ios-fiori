import Combine
import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct KPIHeaderBaseStyle: KPIHeaderStyle {
    public func makeBody(_ configuration: KPIHeaderConfiguration) -> some View {
        // Add default layout here
        VStack(spacing: 0, content: {
            configuration.items
            configuration.bannerMessage
        })
        .interItemSpacing(configuration.interItemSpacing)
        .isItemOrderForced(configuration.isItemOrderForced)
    }
}

// Default fiori styles
extension KPIHeaderFioriStyle {
    struct ContentFioriStyle: KPIHeaderStyle {
        func makeBody(_ configuration: KPIHeaderConfiguration) -> some View {
            KPIHeader(configuration)
            // Add default style for its content
            // .background()
        }
    }
}

/// Style for KPI header
/// Provides a standard hairline for header
public struct KPIHeaderSeparatorStyle: KPIHeaderStyle {
    public init() {}
    public func makeBody(_ configuration: KPIHeaderConfiguration) -> some View {
        VStack {
            KPIHeader(configuration)
            Color.preferredColor(.separator).frame(height: 0.33)
        }
    }
}

import Combine
import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct KPIHeaderBaseStyle: KPIHeaderStyle {
    @Environment(\.headerSeparator) private var separatorConfiguration
    
    public func makeBody(_ configuration: KPIHeaderConfiguration) -> some View {
        // Add default layout here
        configuration.items
            .ifApply(configuration.isPresented) { content in
                VStack {
                    content
                    configuration.bannerMessage
                }
            }
            .ifApply(self.separatorConfiguration.showSeparator) { content in
                VStack {
                    content
                    self.separatorConfiguration.color
                        .frame(height: self.separatorConfiguration.lineWidth)
                }
            }
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

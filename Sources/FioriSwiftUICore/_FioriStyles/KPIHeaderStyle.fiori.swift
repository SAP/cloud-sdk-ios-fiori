import Combine
import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct KPIHeaderBaseStyle: KPIHeaderStyle {
    public func makeBody(_ configuration: KPIHeaderConfiguration) -> some View {
        // Add default layout here
        configuration.items
            .ifApply(configuration.isPresented) { content in
                VStack {
                    content
                    configuration.bannerMessage
                }
            }
            .ifApply(!configuration.isSeparatorHidden && !configuration.isPresented, content: { content in
                VStack {
                    content
                    configuration.separator
                }
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
    
    struct SeparatorFioriStyle: SeparatorStyle {
        let kPIHeaderConfiguration: KPIHeaderConfiguration
    
        func makeBody(_ configuration: SeparatorConfiguration) -> some View {
            Separator(configuration)
            // Add default style for Separator
            // .foregroundStyle(Color.preferredColor(<#fiori color#>))
            // .font(.fiori(forTextStyle: <#fiori font#>))
        }
    }
}

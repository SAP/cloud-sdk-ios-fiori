import Combine
import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct KPIHeaderBaseStyle: KPIHeaderStyle {
    @Environment(\.headerSeparator) private var separatorConfiguration
    @Environment(\.isLoading) var isLoading
    public func makeBody(_ configuration: KPIHeaderConfiguration) -> some View {
        SkeletonLoadingContainer {
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
                            .frame(height: self.isLoading ? 0 : self.separatorConfiguration.lineWidth)
                    }
                }
                .interItemSpacing(configuration.interItemSpacing)
                .isItemOrderForced(configuration.isItemOrderForced)
        }
        .environment(\.isLoading, self.isLoading)
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

/// Provides skeleton loading patterns for `KPIHeader` component.
/// The static properties offer placeholder KPIHeader to display while content is loading,
/// ensuring a consistent and visually appealing loading state across the UI.
public enum KPIHeaderSkeletonLoading {
    /// A placeholder KPIHeader with a single KPIProgressItem.
    public static let kpiProgress = KPIProgressItem(kpiCaption: "Downloading", data: .constant(KPIItemData.percent(0.5)))
}

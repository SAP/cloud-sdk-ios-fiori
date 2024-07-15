import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelineNowIndicatorBaseStyle: TimelineNowIndicatorStyle {
    public func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> some View {
        HStack(alignment: .center, spacing: 0) {
            configuration.nowIndicatorNode
            Rectangle()
                .frame(height: 2)
                .foregroundColor(Color.preferredColor(.tintColor))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

// Default fiori styles
extension TimelineNowIndicatorFioriStyle {
    struct ContentFioriStyle: TimelineNowIndicatorStyle {
        func makeBody(_ configuration: TimelineNowIndicatorConfiguration) -> some View {
            TimelineNowIndicator(configuration)
                .padding(EdgeInsets(top: 0, leading: 88, bottom: 0, trailing: 0))
        }
    }

    struct NowIndicatorNodeFioriStyle: NowIndicatorNodeStyle {
        let timelineNowIndicatorConfiguration: TimelineNowIndicatorConfiguration

        func makeBody(_ configuration: NowIndicatorNodeConfiguration) -> some View {
            NowIndicatorNode(configuration)
                .font(.system(size: 7))
                .foregroundColor(.preferredColor(.tintColor))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

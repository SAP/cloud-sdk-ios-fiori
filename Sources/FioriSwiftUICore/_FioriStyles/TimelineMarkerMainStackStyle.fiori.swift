import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelineMarkerMainStackBaseStyle: TimelineMarkerMainStackStyle {
    public func makeBody(_ configuration: TimelineMarkerMainStackConfiguration) -> some View {
        VStack(alignment: .leading) {
            HStack {
                configuration.title
                Spacer()
            }
            Divider()
                .foregroundColor(Color.preferredColor(.separator).opacity(0.41))
                .frame(height: 0.33)
                .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: -16))
                .offset(y: 16)
        }
    }
}

// Default fiori styles
extension TimelineMarkerMainStackFioriStyle {
    struct ContentFioriStyle: TimelineMarkerMainStackStyle {
        func makeBody(_ configuration: TimelineMarkerMainStackConfiguration) -> some View {
            TimelineMarkerMainStack(configuration)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let timelineMarkerMainStackConfiguration: TimelineMarkerMainStackConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
        }
    }
}

import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelineMarkerBaseStyle: TimelineMarkerStyle {
    @State var timelineMarkerWidth: CGFloat = 100
    @Environment(\.isEnabled) var isEnabled: Bool
    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        ZStack {
            HStack {
                Spacer()
                Rectangle()
                    .foregroundColor(configuration.isPresent ? Color.preferredColor(.blue1) : Color.preferredColor(.secondaryGroupedBackground))
                    .frame(alignment: .trailing)
                    .frame(width: self.timelineMarkerWidth - 92.5)
            }
            HStack(alignment: .top, spacing: 0) {
                configuration._timelineTimeStack
                configuration._timelineMarkerNode
                configuration._timelineMarkerMainStack
            }
            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            .overlay {
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: TimelineMarkerWidthKey.self, value: proxy.size.width)
                }
            }
        }
        .onPreferenceChange(TimelineMarkerWidthKey.self) { value in
            DispatchQueue.main.async {
                self.timelineMarkerWidth = value
            }
        }
    }
}

struct TimelineMarkerWidthKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

// Default fiori styles
extension TimelineMarkerFioriStyle {
    struct ContentFioriStyle: TimelineMarkerStyle {
        func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
            TimelineMarker(configuration)
                .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
        }
    }

    struct TimestampLabelFioriStyle: TimestampLabelStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: TimestampLabelConfiguration) -> some View {
            TimestampLabel(configuration)
                .font(.fiori(forTextStyle: .caption1))
                .foregroundColor(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.separator))
        }
    }

    struct SecondaryTimestampLabelFioriStyle: SecondaryTimestampLabelStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: SecondaryTimestampLabelConfiguration) -> some View {
            SecondaryTimestampLabel(configuration)
                .font(.fiori(forTextStyle: .caption1))
                .foregroundColor(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.separator))
        }
    }

    struct SecondaryTimestampImageFioriStyle: SecondaryTimestampImageStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: SecondaryTimestampImageConfiguration) -> some View {
            SecondaryTimestampImage(configuration)
                .font(.fiori(forTextStyle: .caption1))
                .foregroundColor(self.isEnabled ? Color.preferredColor(.tertiaryLabel) : Color.preferredColor(.separator))
        }
    }

    struct UpperVerticalLineFioriStyle: UpperVerticalLineStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration
    
        func makeBody(_ configuration: UpperVerticalLineConfiguration) -> some View {
            UpperVerticalLine(configuration)
                .frame(width: 2, height: 16)
                .background(self.timelineMarkerConfiguration.isPast || self.timelineMarkerConfiguration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.grey3))
        }
    }
    
    struct NodeImageFioriStyle: NodeImageStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration

        func makeBody(_ configuration: NodeImageConfiguration) -> some View {
            NodeImage(configuration)
                .foregroundColor(self.timelineMarkerConfiguration.isPast || self.timelineMarkerConfiguration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.separatorOpaque))
                .font(.system(size: 9, weight: .bold))
        }
    }

    struct LowerVerticalLineFioriStyle: LowerVerticalLineStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration
    
        func makeBody(_ configuration: LowerVerticalLineConfiguration) -> some View {
            LowerVerticalLine(configuration)
                .frame(width: 2)
                .background(self.timelineMarkerConfiguration.isPast || self.timelineMarkerConfiguration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.grey3))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.separator))
        }
    }

    struct TimelineTimeStackFioriStyle: TimelineTimeStackStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration

        func makeBody(_ configuration: TimelineTimeStackConfiguration) -> some View {
            TimelineTimeStack(configuration)
                .frame(width: 60)
                .background(self.timelineMarkerConfiguration.isPresent ? Color.preferredColor(.secondaryGroupedBackground) : Color.clear)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 0))
                .alignmentGuide(.top) { _ in
                    16
                }
        }
    }

    struct TimelineMarkerNodeFioriStyle: TimelineMarkerNodeStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration

        func makeBody(_ configuration: TimelineMarkerNodeConfiguration) -> some View {
            TimelineMarkerNode(configuration)
                .frame(width: 15)
                .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: 8))
                .alignmentGuide(.top) { _ in
                    16
                }
        }
    }

    struct TimelineMarkerMainStackFioriStyle: TimelineMarkerMainStackStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration

        func makeBody(_ configuration: TimelineMarkerMainStackConfiguration) -> some View {
            TimelineMarkerMainStack(configuration)
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 16))
                .alignmentGuide(.top) { _ in
                    16
                }
        }
    }
}

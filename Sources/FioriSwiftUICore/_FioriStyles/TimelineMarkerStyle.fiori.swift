import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelineMarkerBaseStyle: TimelineMarkerStyle {
    public func makeBody(_ configuration: TimelineMarkerConfiguration) -> some View {
        TimelineMarkerBaseStyleBody(configuration: configuration)
    }
}

private struct TimelineMarkerBaseStyleBody: View {
    let configuration: TimelineMarkerConfiguration
    @State private var timelineMarkerWidth: CGFloat = 100

    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Rectangle()
                    .foregroundStyle(self.configuration.isPresent ? Color.preferredColor(.blue1) : Color.preferredColor(.secondaryGroupedBackground))
                    .frame(alignment: .trailing)
                    .frame(width: max(0, self.timelineMarkerWidth - 92.5))
            }
            HStack(alignment: .top, spacing: 0) {
                VStack(alignment: .trailing) {
                    HStack {
                        Spacer()
                        self.configuration.timestamp
                    }
                    HStack {
                        Spacer()
                        self.configuration.secondaryTimestamp
                    }
                }
                .frame(width: 60)
                .background(self.configuration.isPresent ? Color.preferredColor(.secondaryGroupedBackground) : Color.clear)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 0))
                .alignmentGuide(.top) { _ in
                    16
                }
                VStack(alignment: .center, spacing: 0) {
                    Rectangle()
                        .frame(width: 2, height: 16)
                        .foregroundStyle(self.configuration.isPast || self.configuration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.grey3))
                        .opacity(self.configuration.showUpperVerticalLine ? 1 : 0)
                    if self.configuration.icon.isEmpty {
                        self.configuration.timelineNode
                    } else {
                        self.configuration.icon
                    }
                    Rectangle()
                        .frame(width: 2)
                        .foregroundStyle(self.configuration.isPast || self.configuration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.grey3))
                        .opacity(self.configuration.showLowerVerticalLine ? 1 : 0)
                }
                .frame(width: 15)
                .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: 8))
                .alignmentGuide(.top) { _ in
                    16
                }
                VStack(alignment: .leading) {
                    HStack {
                        self.configuration.title
                        Spacer()
                    }
                    Spacer()
                }
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 16))
                .alignmentGuide(.top) { _ in
                    16
                }
                .background(alignment: .bottom) {
                    Rectangle()
                        .fill(Color.preferredColor(.separator).opacity(0.41))
                        .frame(height: 0.33)
                        .padding(.trailing, -16)
                }
            }
            .fixedSize(horizontal: false, vertical: true)
            .overlay {
                GeometryReader { proxy in
                    Color.clear
                        .preference(key: TimelineMarkerWidthKey.self, value: proxy.size.width)
                }
            }
        }
        .onPreferenceChange(TimelineMarkerWidthKey.self) { value in
            self.timelineMarkerWidth = value
        }
    }
}

struct TimelineMarkerWidthKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
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

    struct TimestampFioriStyle: TimestampStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration

        func makeBody(_ configuration: TimestampConfiguration) -> some View {
            Timestamp(configuration)
                .font(.fiori(forTextStyle: .caption1))
                .foregroundStyle(Color.preferredColor(.primaryLabel))
        }
    }

    struct SecondaryTimestampFioriStyle: SecondaryTimestampStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration

        func makeBody(_ configuration: SecondaryTimestampConfiguration) -> some View {
            SecondaryTimestamp(configuration)
                .font(.fiori(forTextStyle: .caption1))
                .foregroundStyle(Color.preferredColor(.primaryLabel))
        }
    }

    struct TimelineNodeFioriStyle: TimelineNodeStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration

        func makeBody(_ configuration: TimelineNodeConfiguration) -> some View {
            TimelineNode(configuration)
                .foregroundStyle(self.timelineMarkerConfiguration.isPast || self.timelineMarkerConfiguration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.separatorOpaque))
                .font(.system(size: 9, weight: .bold))
        }
    }

    struct IconFioriStyle: IconStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration
    
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .foregroundStyle(self.timelineMarkerConfiguration.isPast || self.timelineMarkerConfiguration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.separatorOpaque))
                .font(.system(size: 9, weight: .bold))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let timelineMarkerConfiguration: TimelineMarkerConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundStyle(Color.preferredColor(.primaryLabel))
        }
    }
}

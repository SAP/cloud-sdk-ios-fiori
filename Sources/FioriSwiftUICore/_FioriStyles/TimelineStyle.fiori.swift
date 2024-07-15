import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelineBaseStyle: TimelineStyle {
    @State var timelineMainStackWidth: CGFloat = 100
    @Environment(\.isEnabled) var isEnabled: Bool
    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    Rectangle()
                        .foregroundColor(configuration.isPresent ? Color.preferredColor(.blue1) : Color.preferredColor(.secondaryGroupedBackground))
                        .frame(alignment: .trailing)
                        .frame(width: self.timelineMainStackWidth - 92.5)
                }
                HStack(alignment: .top, spacing: 0) {
                    VStack(alignment: .trailing) {
                        HStack {
                            Spacer()
                            configuration.timestamp
                        }
                        HStack {
                            Spacer()
                            configuration.secondaryTimestamp
                        }
                    }
                    .frame(width: 60)
                    .background(configuration.isPresent ? Color.preferredColor(.secondaryGroupedBackground) : Color.clear)
                    .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 0))
                    .alignmentGuide(.top) { _ in
                        16
                    }
                    VStack(alignment: .center, spacing: 0) {
                        Rectangle()
                            .frame(width: 2, height: 16)
                            .foregroundColor(configuration.isPast || configuration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.grey3))
                        if configuration.icon.isEmpty {
                            configuration.timelineNode
                        } else {
                            configuration.icon
                        }
                        Rectangle()
                            .frame(width: 2)
                            .foregroundColor(configuration.isPast || configuration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.grey3))
                    }
                    .frame(width: 15)
                    .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: 8))
                    .alignmentGuide(.top) { _ in
                        16
                    }
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                configuration.title
                                configuration.subtitle
                            }
                            Spacer()
                            VStack(alignment: .trailing) {
                                configuration.status
                                configuration.substatus
                            }
                        }
                        HStack(alignment: .top) {
                            configuration.attribute
                            Spacer()
                            configuration.subAttribute
                        }
                        Divider()
                            .foregroundColor(Color.preferredColor(.separator).opacity(0.41))
                            .frame(height: 0.33)
                            .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: -16))
                            .offset(y: 16)
                    }
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 16))
                    .alignmentGuide(.top) { _ in
                        16
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .overlay {
                    GeometryReader { proxy in
                        Color.clear.preference(key: TMSSizePreferenceKey.self, value: proxy.size)
                    }
                }
            }
            .onPreferenceChange(TMSSizePreferenceKey.self) { newValue in
                self.timelineMainStackWidth = newValue.width
            }
        }
    }
}

struct TMSSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

// Default fiori styles
extension TimelineFioriStyle {
    struct ContentFioriStyle: TimelineStyle {
        func makeBody(_ configuration: TimelineConfiguration) -> some View {
            Timeline(configuration)
                .contentShape(.rect)
        }
    }

    struct TimestampFioriStyle: TimestampStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool
    
        func makeBody(_ configuration: TimestampConfiguration) -> some View {
            Timestamp(configuration)
                .font(.fiori(forTextStyle: .caption1))
                .foregroundColor(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct SecondaryTimestampFioriStyle: SecondaryTimestampStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool
    
        func makeBody(_ configuration: SecondaryTimestampConfiguration) -> some View {
            SecondaryTimestamp(configuration)
                .font(.fiori(forTextStyle: .caption1))
                .foregroundColor(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct TimelineNodeFioriStyle: TimelineNodeStyle {
        let timelineConfiguration: TimelineConfiguration
    
        func makeBody(_ configuration: TimelineNodeConfiguration) -> some View {
            TimelineNode(configuration)
                .foregroundColor(self.timelineConfiguration.isPast || self.timelineConfiguration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.separatorOpaque))
                .font(.system(size: 15, weight: .bold))
        }
    }

    struct IconFioriStyle: IconStyle {
        let timelineConfiguration: TimelineConfiguration
    
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .foregroundColor(self.timelineConfiguration.isPast || self.timelineConfiguration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.separatorOpaque))
                .font(.system(size: 15, weight: .bold))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .headline))
                .fontWeight(.semibold)
                .foregroundColor(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundColor(self.isEnabled ? Color.preferredColor(.secondaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct AttributeFioriStyle: AttributeStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: AttributeConfiguration) -> some View {
            Attribute(configuration)
                .font(.fiori(forTextStyle: .footnote))
                .foregroundColor(self.isEnabled ? Color.preferredColor(.secondaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct StatusFioriStyle: StatusStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: StatusConfiguration) -> some View {
            Status(configuration)
                .font(.fiori(forTextStyle: .footnote))
                .foregroundColor(self.isEnabled ? Color.preferredColor(.secondaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct SubstatusFioriStyle: SubstatusStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: SubstatusConfiguration) -> some View {
            Substatus(configuration)
                .font(.fiori(forTextStyle: .footnote))
                .foregroundColor(self.isEnabled ? Color.preferredColor(.secondaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct SubAttributeFioriStyle: SubAttributeStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: SubAttributeConfiguration) -> some View {
            SubAttribute(configuration)
                .font(.fiori(forTextStyle: .footnote))
                .foregroundColor(self.isEnabled ? Color.preferredColor(.secondaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }
}

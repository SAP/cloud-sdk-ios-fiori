import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelineBaseStyle: TimelineStyle {
    public func makeBody(_ configuration: TimelineConfiguration) -> some View {
        TimelineBaseStyleBody(configuration: configuration)
    }
}

private struct TimelineBaseStyleBody: View {
    let configuration: TimelineConfiguration
    @State private var timelineMainStackWidth: CGFloat = 100

    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    Rectangle()
                        .foregroundStyle(self.configuration.isPresent ? Color.preferredColor(.blue1) : Color.preferredColor(.secondaryGroupedBackground))
                        .frame(alignment: .trailing)
                        .frame(width: max(0, self.timelineMainStackWidth - 92.5))
                }
                HStack(alignment: .top, spacing: 0) {
                    TimelineTimestampStack(configuration: self.configuration)
                    TimelineNodeStack(configuration: self.configuration)
                    TimelineMainStack(configuration: self.configuration)
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

struct TimelineTimestampStack: View {
    let configuration: TimelineConfiguration

    var body: some View {
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
    }
}

struct TimelineNodeStack: View {
    let configuration: TimelineConfiguration
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Rectangle()
                .frame(width: 2, height: 16)
                .foregroundStyle(self.configuration.isPast || self.configuration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.grey3))
                .opacity(self.configuration.showUpperVerticalLine == true ? 1 : 0)
            if self.configuration.icon.isEmpty {
                self.configuration.timelineNode
            } else {
                self.configuration.icon
            }
            Rectangle()
                .frame(width: 2)
                .foregroundStyle(self.configuration.isPast || self.configuration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.grey3))
                .opacity(self.configuration.showLowerVerticalLine == true ? 1 : 0)
        }
        .frame(width: 15)
        .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: 8))
        .alignmentGuide(.top) { _ in
            16
        }
    }
}

struct TimelineMainStack: View {
    let configuration: TimelineConfiguration
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    self.configuration.title
                    self.configuration.subtitle
                }
                Spacer()
                VStack(alignment: .trailing) {
                    self.configuration.status
                    self.configuration.substatus
                }
            }
            HStack(alignment: .top) {
                self.configuration.attribute
                Spacer()
                self.configuration.subAttribute
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
}

struct TMSSizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        let next = nextValue()
        value = CGSize(
            width: max(value.width, next.width),
            height: max(value.height, next.height)
        )
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
                .foregroundStyle(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct SecondaryTimestampFioriStyle: SecondaryTimestampStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool
    
        func makeBody(_ configuration: SecondaryTimestampConfiguration) -> some View {
            SecondaryTimestamp(configuration)
                .font(.fiori(forTextStyle: .caption1))
                .foregroundStyle(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct TimelineNodeFioriStyle: TimelineNodeStyle {
        let timelineConfiguration: TimelineConfiguration
    
        func makeBody(_ configuration: TimelineNodeConfiguration) -> some View {
            TimelineNode(configuration)
                .foregroundStyle(self.timelineConfiguration.isPast || self.timelineConfiguration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.separatorOpaque))
                .font(.system(size: 15, weight: .bold))
        }
    }

    struct IconFioriStyle: IconStyle {
        let timelineConfiguration: TimelineConfiguration
    
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .foregroundStyle(self.timelineConfiguration.isPast || self.timelineConfiguration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.separatorOpaque))
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
                .foregroundStyle(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct SubtitleFioriStyle: SubtitleStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: SubtitleConfiguration) -> some View {
            Subtitle(configuration)
                .font(.fiori(forTextStyle: .subheadline))
                .foregroundStyle(self.isEnabled ? Color.preferredColor(.secondaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct AttributeFioriStyle: AttributeStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: AttributeConfiguration) -> some View {
            Attribute(configuration)
                .font(.fiori(forTextStyle: .footnote))
                .foregroundStyle(self.isEnabled ? Color.preferredColor(.secondaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct StatusFioriStyle: StatusStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: StatusConfiguration) -> some View {
            Status(configuration)
                .font(.fiori(forTextStyle: .footnote))
                .foregroundStyle(self.isEnabled ? Color.preferredColor(.secondaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct SubstatusFioriStyle: SubstatusStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: SubstatusConfiguration) -> some View {
            Substatus(configuration)
                .font(.fiori(forTextStyle: .footnote))
                .foregroundStyle(self.isEnabled ? Color.preferredColor(.secondaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct SubAttributeFioriStyle: SubAttributeStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: SubAttributeConfiguration) -> some View {
            SubAttribute(configuration)
                .font(.fiori(forTextStyle: .footnote))
                .foregroundStyle(self.isEnabled ? Color.preferredColor(.secondaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }
}

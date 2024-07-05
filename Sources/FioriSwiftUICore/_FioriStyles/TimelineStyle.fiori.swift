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
                    configuration._timelineTimeStack
                    configuration._timelineNode
                    configuration._timelineMainStack
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

    struct TimestampLabelFioriStyle: TimestampLabelStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: TimestampLabelConfiguration) -> some View {
            TimestampLabel(configuration)
                .font(.fiori(forTextStyle: .caption1))
                .foregroundColor(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct SecondaryTimestampLabelFioriStyle: SecondaryTimestampLabelStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: SecondaryTimestampLabelConfiguration) -> some View {
            SecondaryTimestampLabel(configuration)
                .font(.fiori(forTextStyle: .caption1))
                .foregroundColor(self.isEnabled ? Color.preferredColor(.primaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct SecondaryTimestampImageFioriStyle: SecondaryTimestampImageStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: SecondaryTimestampImageConfiguration) -> some View {
            SecondaryTimestampImage(configuration)
                .foregroundColor(self.isEnabled ? Color.preferredColor(.tertiaryLabel) : Color.preferredColor(.quaternaryLabel))
        }
    }

    struct UpperVerticalLineFioriStyle: UpperVerticalLineStyle {
        let timelineConfiguration: TimelineConfiguration
    
        func makeBody(_ configuration: UpperVerticalLineConfiguration) -> some View {
            UpperVerticalLine(configuration)
                .frame(width: 2, height: 16)
                .background(self.timelineConfiguration.isPast || self.timelineConfiguration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.grey3))
        }
    }
    
    struct NodeImageFioriStyle: NodeImageStyle {
        let timelineConfiguration: TimelineConfiguration

        func makeBody(_ configuration: NodeImageConfiguration) -> some View {
            NodeImage(configuration)
                .foregroundColor(self.timelineConfiguration.isPast || self.timelineConfiguration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.separatorOpaque))
                .font(.system(size: 15, weight: .bold))
        }
    }

    struct LowerVerticalLineFioriStyle: LowerVerticalLineStyle {
        let timelineConfiguration: TimelineConfiguration
    
        func makeBody(_ configuration: LowerVerticalLineConfiguration) -> some View {
            LowerVerticalLine(configuration)
                .frame(width: 2)
                .background(self.timelineConfiguration.isPast || self.timelineConfiguration.isPresent ? Color.preferredColor(.tintColor) : Color.preferredColor(.grey3))
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let timelineConfiguration: TimelineConfiguration
        @Environment(\.isEnabled) var isEnabled: Bool

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .font(.fiori(forTextStyle: .headline))
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

    struct TimelineTimeStackFioriStyle: TimelineTimeStackStyle {
        let timelineConfiguration: TimelineConfiguration

        func makeBody(_ configuration: TimelineTimeStackConfiguration) -> some View {
            TimelineTimeStack(configuration)
                .frame(width: 60)
                .background(self.timelineConfiguration.isPresent ? Color.preferredColor(.secondaryGroupedBackground) : Color.clear)
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 0))
                .alignmentGuide(.top) { _ in
                    16
                }
        }
    }

    struct TimelineNodeFioriStyle: TimelineNodeStyle {
        let timelineConfiguration: TimelineConfiguration

        func makeBody(_ configuration: TimelineNodeConfiguration) -> some View {
            TimelineNode(configuration)
                .frame(width: 15)
                .padding(EdgeInsets(top: 0, leading: 9, bottom: 0, trailing: 8))
                .alignmentGuide(.top) { _ in
                    16
                }
        }
    }

    struct TimelineMainStackFioriStyle: TimelineMainStackStyle {
        let timelineConfiguration: TimelineConfiguration

        func makeBody(_ configuration: TimelineMainStackConfiguration) -> some View {
            TimelineMainStack(configuration)
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 16))
                .alignmentGuide(.top) { _ in
                    16
                }
        }
    }
}

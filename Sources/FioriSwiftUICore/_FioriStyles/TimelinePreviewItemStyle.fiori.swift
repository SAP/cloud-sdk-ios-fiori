import FioriThemeManager
import Foundation
import SwiftUI

// Base Layout style
public struct TimelinePreviewItemBaseStyle: TimelinePreviewItemStyle {
    public func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            configuration.timestamp
            HStack(alignment: .center, spacing: 0) {
                if configuration.icon.isEmpty {
                    configuration.timelineNode
                } else {
                    configuration.icon
                }
                if configuration.data.timelineNode != TimelineNodeType.end {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Color.preferredColor(configuration.data.isFuture ?? false ? .separatorOpaque : .tintColor))
                        .padding(.trailing, -3)
                } else {
                    Spacer()
                }
            }
            .frame(minHeight: 15)
            .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
            configuration.title
        }
    }
}

// Default fiori styles
extension TimelinePreviewItemFioriStyle {
    struct ContentFioriStyle: TimelinePreviewItemStyle {
        func makeBody(_ configuration: TimelinePreviewItemConfiguration) -> some View {
            TimelinePreviewItem(configuration)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }

    struct TitleFioriStyle: TitleStyle {
        let timelinePreviewItemConfiguration: TimelinePreviewItemConfiguration

        func makeBody(_ configuration: TitleConfiguration) -> some View {
            Title(configuration)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.preferredColor(.primaryLabel))
                .font(.fiori(forTextStyle: .subheadline))
                .alignmentGuide(.timelinePreviewAlignmentGuide) { context in
                    context[.firstTextBaseline]
                }
                .multilineTextAlignment(.leading)
        }
    }

    struct IconFioriStyle: IconStyle {
        let timelinePreviewItemConfiguration: TimelinePreviewItemConfiguration
        
        func makeBody(_ configuration: IconConfiguration) -> some View {
            Icon(configuration)
                .font(.system(size: TimelineStyleHelpers.getFontSize(for: self.timelinePreviewItemConfiguration), weight: .bold))
                .foregroundColor(Color.preferredColor(self.timelinePreviewItemConfiguration.data.isFuture ?? false ? .separatorOpaque : .tintColor))
        }
    }

    struct TimelineNodeFioriStyle: TimelineNodeStyle {
        let timelinePreviewItemConfiguration: TimelinePreviewItemConfiguration

        func makeBody(_ configuration: TimelineNodeConfiguration) -> some View {
            TimelineNode(configuration)
                .font(.system(size: TimelineStyleHelpers.getFontSize(for: self.timelinePreviewItemConfiguration), weight: .bold))
                .foregroundColor(Color.preferredColor(self.timelinePreviewItemConfiguration.data.isFuture ?? false ? .separatorOpaque : .tintColor))
        }
    }

    struct TimestampFioriStyle: TimestampStyle {
        let timelinePreviewItemConfiguration: TimelinePreviewItemConfiguration

        func makeBody(_ configuration: TimestampConfiguration) -> some View {
            Timestamp(configuration)
                .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.preferredColor(.tertiaryLabel))
                .font(.fiori(forTextStyle: .footnote))
                .alignmentGuide(.timelinePreviewAlignmentGuide) { context in
                    context[.lastTextBaseline]
                }
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/ .leading/*@END_MENU_TOKEN@*/)
        }
    }

    enum TimelineStyleHelpers {
        static func getFontSize(for configuration: TimelinePreviewItemConfiguration) -> CGFloat {
            let nodeType = configuration.data.timelineNode

            switch nodeType {
            case .beforeStart, .start, .beforeEnd, .end:
                return 9
            default:
                return 15
            }
        }
    }
}

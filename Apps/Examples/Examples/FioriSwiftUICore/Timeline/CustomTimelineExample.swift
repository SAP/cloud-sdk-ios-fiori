import FioriSwiftUICore
import SwiftUI

struct CustomTimelineExample: View {
    var body: some View {
        List {
            Section(header: Text("Custom Timeline Example")) {
                TimelineMarker(timestampLabel: "06/03/24", secondaryTimestampImage: Image(systemName: "sun.max"), nodeImage: .predefine(TimelineNodeStatus.beforeStart), showUpperVerticalLine: false, title: "POC", isPast: true)
                    .modifier(CustomListRowModifier())
                    .secondaryTimestampImageStyle(content: { config in
                        config.secondaryTimestampImage.foregroundColor(.yellow)
                    })
                TimelineMarker(timestampLabel: "06/05/24", secondaryTimestampLabel: "Sunny", nodeImage: .predefine(TimelineNodeStatus.start), title: "Project Start", isPast: true)
                    .modifier(CustomListRowModifier())
                    .timestampLabelStyle(content: { config in
                        config.timestampLabel.foregroundColor(.red)
                    })
                    .secondaryTimestampLabelStyle(content: { config in
                        config.secondaryTimestampLabel.foregroundColor(.red)
                    })
                    .upperVerticalLineStyle(content: { config in
                        config.upperVerticalLine.background(.yellow)
                    })
                    .nodeImageStyle(content: { config in
                        config.nodeImage.foregroundColor(.yellow)
                    })
                    .lowerVerticalLineStyle(content: { config in
                        config.lowerVerticalLine.background(.yellow)
                    })
                    .titleStyle(content: { config in
                        config.title.foregroundColor(.red)
                    })
                Timeline(timestampLabel: "06/12/24", secondaryTimestampImage: Image(systemName: "sun.max"), nodeImage: .predefine(TimelineNodeStatus.complete), title: "Project Phase 1", attribute: "xx features implementation done", status: .text("Done"), isPast: true)
                    .modifier(CustomListRowModifier())
                    .secondaryTimestampImageStyle(content: { config in
                        config.secondaryTimestampImage.foregroundColor(.yellow)
                    })
                Timeline(timestampLabel: "06/20/24", nodeImage: .predefine(TimelineNodeStatus.inProgress), title: "Project Phase 2", subtitle: "Integration test", status: .text("ongoing"), isPresent: true)
                    .modifier(CustomListRowModifier())
                TimelineNowIndicator()
                    .modifier(CustomListRowModifier())
                Timeline(timestampLabel: "06/25/24", nodeImage: .predefine(TimelineNodeStatus.open), title: "Project Phase 3", attribute: "feature list: xx, xx, xx", status: .text("pending"))
                    .modifier(CustomListRowModifier())
                    .timestampLabelStyle(content: { config in
                        config.timestampLabel.foregroundColor(.red)
                    })
                    .secondaryTimestampLabelStyle(content: { config in
                        config.secondaryTimestampLabel.foregroundColor(.red)
                    })
                    .upperVerticalLineStyle(content: { config in
                        config.upperVerticalLine.background(.yellow)
                    })
                    .nodeImageStyle(content: { config in
                        config.nodeImage.foregroundColor(.yellow)
                    })
                    .lowerVerticalLineStyle(content: { config in
                        config.lowerVerticalLine.background(.yellow)
                    })
                    .titleStyle(content: { config in
                        config.title.foregroundColor(.red)
                    })
                    .statusStyle(content: { config in
                        config.status.foregroundColor(.red)
                    })
                    .attributeStyle(content: { config in
                        config.attribute.foregroundColor(.red)
                    })
                Timeline(timestampLabel: "06/28/24", nodeImage: .custom(Image(systemName: "p.circle")), title: "Project Phase 4", attribute: "feature list: xx, xx, xx", status: .text("pending"))
                    .modifier(CustomListRowModifier())
                    .nodeImageStyle(content: { config in
                        config.nodeImage.foregroundColor(.cyan)
                    })
                TimelineMarker(timestampLabel: "07/06/24", nodeImage: .custom(Image(systemName: "a.circle")), title: "Accept Test")
                    .modifier(CustomListRowModifier())
                    .nodeImageStyle(content: { config in
                        config.nodeImage.foregroundColor(.red)
                    })
                TimelineMarker(timestampLabel: "07/09/24", secondaryTimestampImage: Image(systemName: "sun.max"), nodeImage: .predefine(TimelineNodeStatus.end), showLowerVerticalLine: false, title: "Project End")
                    .modifier(CustomListRowModifier())
                    .secondaryTimestampImageStyle(content: { config in
                        config.secondaryTimestampImage.foregroundColor(.yellow)
                    })
            }
        }
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 7)
    }
}

#Preview {
    CustomTimelineExample()
}

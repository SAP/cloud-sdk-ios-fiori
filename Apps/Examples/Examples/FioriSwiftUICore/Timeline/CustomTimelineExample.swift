import FioriSwiftUICore
import SwiftUI

struct CustomTimelineExample: View {
    var body: some View {
        List {
            Section(header: Text("Custom Timeline Example")) {
                TimelineMarker(timestamp: "06/03/24", secondaryTimestamp: .icon(Image(systemName: "sun.max")), timelineNode: .beforeStart, title: "POC", isPast: true, showUpperVerticalLine: false)
                    .modifier(CustomListRowModifier())
                    .secondaryTimestampStyle(content: { config in
                        config.secondaryTimestamp.foregroundColor(.yellow)
                    })
                TimelineMarker(timestamp: "06/05/24", secondaryTimestamp: .text("Sunny"), timelineNode: .start, title: "Project Start", isPast: true)
                    .modifier(CustomListRowModifier())
                    .timestampStyle(content: { config in
                        config.timestamp.foregroundColor(.red)
                    })
                    .secondaryTimestampStyle(content: { config in
                        config.secondaryTimestamp.foregroundColor(.red)
                    })
                    .timelineNodeStyle(content: { config in
                        config.timelineNode.foregroundColor(.yellow)
                    })
                    .titleStyle(content: { config in
                        config.title.foregroundColor(.red)
                    })
                Timeline(timestamp: "06/12/24", secondaryTimestamp: .icon(Image(systemName: "sun.max")), timelineNode: .complete, title: "Project Phase 1", attribute: "xx features implementation done", status: .text("Done"), isPast: true)
                    .modifier(CustomListRowModifier())
                    .secondaryTimestampStyle(content: { config in
                        config.secondaryTimestamp.foregroundColor(.yellow)
                    })
                Timeline(timestamp: "06/20/24", timelineNode: .inProgress, title: "Project Phase 2", subtitle: "Integration test", status: .text("ongoing"), isPresent: true)
                    .modifier(CustomListRowModifier())
                TimelineNowIndicator()
                    .modifier(CustomListRowModifier())
                Timeline(timestamp: "06/25/24", timelineNode: .open, title: "Project Phase 3", attribute: "feature list: xx, xx, xx", status: .text("pending"))
                    .modifier(CustomListRowModifier())
                    .timestampStyle(content: { config in
                        config.timestamp.foregroundColor(.red)
                    })
                    .secondaryTimestampStyle(content: { config in
                        config.secondaryTimestamp.foregroundColor(.red)
                    })
                    .timelineNodeStyle(content: { config in
                        config.timelineNode.foregroundColor(.yellow)
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
                Timeline(timestamp: "06/28/24", timelineNode: .open, icon: Image(systemName: "p.circle"), title: "Project Phase 4", attribute: "feature list: xx, xx, xx", status: .text("pending"))
                    .modifier(CustomListRowModifier())
                    .iconStyle(content: { config in
                        config.icon.foregroundColor(.cyan)
                    })
                TimelineMarker(timestamp: "07/06/24", timelineNode: .open, icon: Image(systemName: "a.circle"), title: "Accept Test")
                    .modifier(CustomListRowModifier())
                    .iconStyle(content: { config in
                        config.icon.foregroundColor(.red)
                    })
                TimelineMarker(timestamp: "07/09/24", secondaryTimestamp: .icon(Image(systemName: "sun.max")), timelineNode: .end, title: "Project End", showLowerVerticalLine: false)
                    .modifier(CustomListRowModifier())
                    .secondaryTimestampStyle(content: { config in
                        config.secondaryTimestamp.foregroundColor(.yellow)
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

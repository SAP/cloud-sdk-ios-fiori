import FioriSwiftUICore
import SwiftUI

struct SimpleTimelineExample: View {
    var body: some View {
        List {
            Section(header: Text("Simple Timeline Example")) {
                TimelineMarker(timestamp: "06/03/24", secondaryTimestamp: .icon(Image(systemName: "sun.max")), timelineNode: .beforeStart, title: "POC", isPast: true, showUpperVerticalLine: false)
                    .modifier(CustomListRowModifier())
                    .secondaryTimestampStyle(content: { config in
                        config.secondaryTimestamp.foregroundColor(.yellow)
                    })
                TimelineMarker(timestamp: "06/05/24", secondaryTimestamp: .text("Sunny"), timelineNode: .start, title: "Project Start", isPast: true)
                    .modifier(CustomListRowModifier())
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
                Timeline(timestamp: "06/28/24", timelineNode: .open, title: "Project Phase 4", attribute: "feature list: xx, xx, xx", status: .text("pending"))
                    .modifier(CustomListRowModifier())
                TimelineMarker(timestamp: "07/05/24", timelineNode: .beforeEnd, title: "Accept Test")
                    .modifier(CustomListRowModifier())
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
    SimpleTimelineExample()
}

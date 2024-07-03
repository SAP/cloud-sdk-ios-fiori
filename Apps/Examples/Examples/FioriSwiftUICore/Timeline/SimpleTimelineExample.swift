import FioriSwiftUICore
import SwiftUI

struct SimpleTimelineExample: View {
    var body: some View {
        List {
            Section(header: Text("Simple Timeline Example")) {
                TimelineMarker(timestampLabel: "06/03/24", secondaryTimestampImage: Image(systemName: "sun.max"), nodeImage: .predefine(TimelineNodeStatus.beforeStart), showUpperVerticalLine: false, title: "POC", isPast: true)
                    .modifier(CustomListRowModifier())
                    .secondaryTimestampImageStyle(content: { config in
                        config.secondaryTimestampImage.foregroundColor(.yellow)
                    })
                TimelineMarker(timestampLabel: "06/05/24", secondaryTimestampLabel: "Sunny", nodeImage: .predefine(TimelineNodeStatus.start), title: "Project Start", isPast: true)
                    .modifier(CustomListRowModifier())
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
                Timeline(timestampLabel: "06/28/24", nodeImage: .predefine(TimelineNodeStatus.open), title: "Project Phase 4", attribute: "feature list: xx, xx, xx", status: .text("pending"))
                    .modifier(CustomListRowModifier())
                TimelineMarker(timestampLabel: "07/05/24", nodeImage: .predefine(TimelineNodeStatus.beforeEnd), title: "Accept Test")
                    .modifier(CustomListRowModifier())
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
    SimpleTimelineExample()
}

import FioriSwiftUICore
import SwiftUI

struct SimpleTimelinePreviewExample: View {
    @State private var items0: [TimelinePreviewItemModel] = [
        TimelinePreviewItemModel(title: "POC", timelineNode: TimelineNodeType.beforeStart, due: ISO8601DateFormatter().date(from: "2024-06-03T12:00:00Z")!),
        TimelinePreviewItemModel(title: "Project Phase 3", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2024-06-25T12:00:00Z")!),
        TimelinePreviewItemModel(title: "Project Phase 2", timelineNode: TimelineNodeType.inProgress, due: ISO8601DateFormatter().date(from: "2024-06-20T12:00:00Z")!),
        TimelinePreviewItemModel(title: "Project Phase 1", timelineNode: TimelineNodeType.complete, due: ISO8601DateFormatter().date(from: "2024-06-12T12:00:00Z")!),
        TimelinePreviewItemModel(title: "Project Start", timelineNode: TimelineNodeType.start, due: ISO8601DateFormatter().date(from: "2024-06-05T12:00:00Z")!),
        TimelinePreviewItemModel(title: "Project End", timelineNode: TimelineNodeType.end, due: ISO8601DateFormatter().date(from: "2024-07-25T12:00:00Z")!),
        TimelinePreviewItemModel(title: "Accept Test", timelineNode: TimelineNodeType.beforeEnd, due: ISO8601DateFormatter().date(from: "2024-07-15T12:00:00Z")!),
        TimelinePreviewItemModel(title: "Project Phase 4", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2024-07-05T12:00:00Z")!)
    ]
    
    var body: some View {
        VStack {
            NavigationLink(destination: TimelineView()) {
                TimelinePreview(headerTitle: { Text("Timeline Preview") }, data: self.$items0)
            }
            Spacer()
        }
    }
}

struct TimelineView: View {
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
    SimpleTimelinePreviewExample()
}

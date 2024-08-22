import FioriSwiftUICore
import SwiftUI

struct TimelinePreviewExample: View {
    @State private var items0: [TimelinePreviewItemModel] = [
        TimelinePreviewItemModel(title: "Open", icon: Image(systemName: "a.square"), timelineNode: TimelineNodeType.inProgress, due: ISO8601DateFormatter().date(from: "2025-09-21T12:00:00Z")!),
        TimelinePreviewItemModel(title: "Before start", timelineNode: TimelineNodeType.start, due: ISO8601DateFormatter().date(from: "2025-07-23T12:00:00Z")!),
        TimelinePreviewItemModel(title: "Start", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2025-08-16T12:00:00Z")!),
        TimelinePreviewItemModel(title: "Open", timelineNode: TimelineNodeType.inProgress, due: ISO8601DateFormatter().date(from: "2025-08-15T12:00:00Z")!),
        TimelinePreviewItemModel(title: "Open", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2025-09-27T12:00:00Z")!)
    ]
    @State private var items1: [TimelinePreviewItemModel] = [
        TimelinePreviewItemModel(title: "Open", timelineNode: TimelineNodeType.inProgress, due: ISO8601DateFormatter().date(from: "2024-09-21T12:00:00Z")!),
        TimelinePreviewItemModel(title: "LooooooooooooooooooooooongTitle", timelineNode: TimelineNodeType.start, due: ISO8601DateFormatter().date(from: "2024-07-23T12:00:00Z")!, dateFormat: "EEEE, MMMM dd, yyyy h:mm a"),
        TimelinePreviewItemModel(title: "Start", timelineNode: TimelineNodeType.start, due: ISO8601DateFormatter().date(from: "2024-08-29T12:00:00Z")!),
        TimelinePreviewItemModel(title: "Open", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2024-08-25T12:00:00Z")!, dateFormat: "EEEE, MMMM dd, yyyy h:mm a"),
        TimelinePreviewItemModel(title: "Open", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2024-09-27T12:00:00Z")!),
        TimelinePreviewItemModel(title: "Open", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2024-09-07T12:00:00Z")!)
    ]
    @State private var items2: [TimelinePreviewItemModel] = [
        TimelinePreviewItemModel(title: "Open", timelineNode: TimelineNodeType.inProgress, due: ISO8601DateFormatter().date(from: "2023-09-21T12:00:00Z")!),
        TimelinePreviewItemModel(title: "Start", timelineNode: TimelineNodeType.start, due: ISO8601DateFormatter().date(from: "2023-08-10T12:00:00Z")!, dateFormat: "EEEE, MMMM dd, yyyy h:mm a"),
        TimelinePreviewItemModel(title: "Open", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2023-08-17T12:00:00Z")!),
        TimelinePreviewItemModel(title: "Open", timelineNode: TimelineNodeType.end, due: ISO8601DateFormatter().date(from: "2023-09-27T12:00:00Z")!)
    ]
    @State private var items3: [TimelinePreviewItemModel] = [
        TimelinePreviewItemModel(title: "Inprogress", timelineNode: TimelineNodeType.inProgress, due: ISO8601DateFormatter().date(from: "2024-07-21T12:00:00Z")!),
        TimelinePreviewItemModel(title: "End", timelineNode: TimelineNodeType.end, due: ISO8601DateFormatter().date(from: "2024-08-26T12:00:00Z")!)
    ]
    
    var body: some View {
        List {
            Text("TimelinePreview: Future")
            TimelinePreview(title: { Text("Timeline") }, data: self.$items0)
            Text("TimelinePreview: Present")
            TimelinePreview(title: { Text("Timeline") }, data: self.$items1)
            Text("TimelinePreview: Past")
            TimelinePreview(title: { Text("Timeline") }, data: self.$items2)
            Text("TimelinePreview: No Header")
            TimelinePreview(title: { Text("Timeline") }, data: self.$items2, showHeader: false)
            Text("TimelinePreview: End")
            TimelinePreview(title: { Text("Timeline") }, data: self.$items3)
        }
        .listStyle(.plain)
    }
}

#Preview {
    TimelinePreviewExample()
}

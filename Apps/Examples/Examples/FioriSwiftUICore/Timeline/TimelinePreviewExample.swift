import FioriSwiftUICore
import SwiftUI

struct TimelinePreviewItemModelImplementation: TimelinePreviewItemModel {
    var id: UUID
    var title: String
    var icon: Image?
    var timelineNode: FioriSwiftUICore.TimelineNodeType
    var due: Date
    var formatter: DateFormatter?
    var isFuture: Bool?
    var isCurrent: Bool?
    
    init(id: UUID = UUID(), title: String, icon: Image? = nil, timelineNode: FioriSwiftUICore.TimelineNodeType, due: Date, dateFormat: String? = nil, isFuture: Bool? = nil, isCurrent: Bool? = nil) {
        self.id = id
        self.title = title
        self.icon = icon
        self.timelineNode = timelineNode
        self.due = due
        self.formatter = DateFormatter()
        if let dateFormat {
            self.formatter?.dateFormat = dateFormat
        } else {
            self.formatter?.dateFormat = "MMMM dd yyyy"
        }
        self.isFuture = isFuture
        self.isCurrent = isCurrent
    }
}

struct TimelinePreviewExample: View {
    @State private var items0: [TimelinePreviewItemModelImplementation] = [
        TimelinePreviewItemModelImplementation(title: "Open", icon: Image(systemName: "a.square"), timelineNode: TimelineNodeType.inProgress, due: ISO8601DateFormatter().date(from: "2025-09-21T12:00:00Z")!),
        TimelinePreviewItemModelImplementation(title: "Before start", timelineNode: TimelineNodeType.start, due: ISO8601DateFormatter().date(from: "2025-07-23T12:00:00Z")!),
        TimelinePreviewItemModelImplementation(title: "Start", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2025-08-16T12:00:00Z")!),
        TimelinePreviewItemModelImplementation(title: "Open", timelineNode: TimelineNodeType.inProgress, due: ISO8601DateFormatter().date(from: "2025-08-15T12:00:00Z")!),
        TimelinePreviewItemModelImplementation(title: "Open", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2025-09-27T12:00:00Z")!)
    ]
    @State private var items1: [TimelinePreviewItemModelImplementation] = [
        TimelinePreviewItemModelImplementation(title: "Open", timelineNode: TimelineNodeType.inProgress, due: ISO8601DateFormatter().date(from: "2024-09-21T12:00:00Z")!),
        TimelinePreviewItemModelImplementation(title: "LooooooooooooooooooooooongTitle", timelineNode: TimelineNodeType.start, due: ISO8601DateFormatter().date(from: "2024-07-23T12:00:00Z")!),
        TimelinePreviewItemModelImplementation(title: "Start", timelineNode: TimelineNodeType.start, due: ISO8601DateFormatter().date(from: "2024-08-29T12:00:00Z")!),
        TimelinePreviewItemModelImplementation(title: "Open", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2024-08-27T12:00:00Z")!),
        TimelinePreviewItemModelImplementation(title: "Open", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2024-09-27T12:00:00Z")!),
        TimelinePreviewItemModelImplementation(title: "Open", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2024-09-07T12:00:00Z")!)
    ]
    @State private var items2: [TimelinePreviewItemModelImplementation] = [
        TimelinePreviewItemModelImplementation(title: "Open", timelineNode: TimelineNodeType.inProgress, due: ISO8601DateFormatter().date(from: "2023-09-21T12:00:00Z")!),
        TimelinePreviewItemModelImplementation(title: "Start", timelineNode: TimelineNodeType.start, due: ISO8601DateFormatter().date(from: "2023-08-10T12:00:00Z")!, dateFormat: "EEEE, MMMM dd, yyyy h:mm a"),
        TimelinePreviewItemModelImplementation(title: "Open", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2023-08-17T12:00:00Z")!),
        TimelinePreviewItemModelImplementation(title: "Open", timelineNode: TimelineNodeType.end, due: ISO8601DateFormatter().date(from: "2023-09-27T12:00:00Z")!)
    ]
    @State private var items3: [TimelinePreviewItemModelImplementation] = [
        TimelinePreviewItemModelImplementation(title: "Inprogress", timelineNode: TimelineNodeType.inProgress, due: ISO8601DateFormatter().date(from: "2024-07-21T12:00:00Z")!),
        TimelinePreviewItemModelImplementation(title: "End", timelineNode: TimelineNodeType.end, due: ISO8601DateFormatter().date(from: "2024-08-26T12:00:00Z")!)
    ]
    
    var body: some View {
        List {
            Text("TimelinePreview: Future")
            TimelinePreview(optionalTitle: { Text("Timeline") }, items: .constant(self.items0.map { $0 as any TimelinePreviewItemModel }))
            Text("TimelinePreview: Present")
            TimelinePreview(optionalTitle: { Text("Timeline") }, items: .constant(self.items1.map { $0 as any TimelinePreviewItemModel }))
            Text("TimelinePreview: Past")
            TimelinePreview(optionalTitle: { Text("Timeline") }, items: .constant(self.items2.map { $0 as any TimelinePreviewItemModel }))
            Text("TimelinePreview: No Header")
            TimelinePreview(items: .constant(self.items2.map { $0 as any TimelinePreviewItemModel }))
            Text("TimelinePreview: End")
            TimelinePreview(optionalTitle: { Text("Timeline") }, items: .constant(self.items3.map { $0 as any TimelinePreviewItemModel }))
        }
        .listStyle(.plain)
    }
}

#Preview {
    TimelinePreviewExample()
}

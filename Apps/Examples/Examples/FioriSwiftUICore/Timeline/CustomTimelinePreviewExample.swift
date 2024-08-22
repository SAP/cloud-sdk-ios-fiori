import FioriSwiftUICore
import SwiftUI

struct CustomTimelinePreviewExample: View {
    @State private var items0: [TimelinePreviewItemModel] = [
        TimelinePreviewItemModel(title: "open", icon: Image(systemName: "a.square"), timelineNode: TimelineNodeType.inProgress, due: ISO8601DateFormatter().date(from: "2024-09-21T12:00:00Z")!, dateFormat: "dd/MM/yyyy"),
        TimelinePreviewItemModel(title: "Before start", icon: Image(systemName: "a.square"), timelineNode: TimelineNodeType.start, due: ISO8601DateFormatter().date(from: "2024-07-23T12:00:00Z")!, dateFormat: "dd/MM/yyyy"),
        TimelinePreviewItemModel(title: "start", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2024-08-19T12:00:00Z")!),
        TimelinePreviewItemModel(title: "open", icon: Image(systemName: "o.square"), timelineNode: TimelineNodeType.inProgress, due: ISO8601DateFormatter().date(from: "2024-08-17T12:00:00Z")!),
        TimelinePreviewItemModel(title: "open", timelineNode: TimelineNodeType.open, due: ISO8601DateFormatter().date(from: "2024-09-27T12:00:00Z")!)
    ]
    
    var body: some View {
        VStack {
            TimelinePreview(
                title: { Text("Timeline") },
                action: {
                    FioriButton(
                        label: { _ in
                            Label("See All (\(self.items0.count))", systemImage: "arrowtriangle.right")
                                .labelStyle(MyLabelStyle())
                        }
                    )
                },
                data: self.$items0
            )
            .timelinePreviewItemStyle(content: { config in
                TimelinePreviewItem(config)
                    .titleStyle(content: { titleConfig in
                        titleConfig.title.foregroundColor(.yellow)
                    })
                    .timestampStyle(content: { timestampConfig in
                        timestampConfig.timestamp.foregroundColor(.red)
                    })
            })
            .titleStyle(content: { config in
                config.title.foregroundColor(.purple)
            })
            Spacer()
        }
    }
}

struct MyLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center) {
            configuration.title
                .foregroundColor(.purple)
            configuration.icon
                .foregroundColor(.green)
        }
    }
}

#Preview {
    CustomTimelinePreviewExample()
}

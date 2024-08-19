import SwiftUI

struct TimelineExample: View {
    var body: some View {
        List {
            Section(header: Text("TimelinePreview")) {
                NavigationLink("Simple TimelinePreview Example", destination: TimelinePreviewExample())
                NavigationLink("Simple TimelinePreview Use Case", destination: SimpleTimelinePreviewExample())
                NavigationLink("Custom TimelinePreview Example", destination: CustomTimelinePreviewExample())
            }
            Section(header: Text("Timeline")) {
                NavigationLink("Timeline Items", destination: TimelineItemsExample())
                NavigationLink("Simple Timeline Example", destination: SimpleTimelineExample())
                NavigationLink("Custom Timeline Example", destination: CustomTimelineExample())
            }
        }
    }
}

#Preview {
    TimelineExample()
}

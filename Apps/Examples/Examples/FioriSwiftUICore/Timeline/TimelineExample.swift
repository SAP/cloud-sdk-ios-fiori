import SwiftUI

struct TimelineExample: View {
    var body: some View {
        List {
            NavigationLink("TimelineItems", destination: TimelineItemsExample())
            NavigationLink("SimpleTimelineExample", destination: SimpleTimelineExample())
            NavigationLink("CustomTimelineExample", destination: CustomTimelineExample())
        }
    }
}

#Preview {
    TimelineExample()
}

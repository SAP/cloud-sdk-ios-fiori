import FioriSwiftUICore
import SwiftUI

struct TimelineItemsExample: View {
    var body: some View {
        List {
            Section(header: Text("TimelineMarker")) {
                TimelineMarker(timestampLabel: "06/20/24", secondaryTimestampImage: Image(systemName: "sun.max"), nodeImage: .predefine(TimelineNodeStatus.beforeStart), showUpperVerticalLine: false, title: "Before Start", isPast: true)
                    .modifier(CustomListRowModifier())
                    .secondaryTimestampImageStyle(content: { config in
                        config.secondaryTimestampImage.foregroundColor(.yellow)
                    })
                TimelineMarker(timestampLabel: "06/20/24", secondaryTimestampLabel: "Sunny", nodeImage: .predefine(TimelineNodeStatus.start), title: "Start", isPresent: true)
                    .modifier(CustomListRowModifier())
                TimelineMarker(timestampLabel: "06/20/24", secondaryTimestampLabel: "Sunny", nodeImage: .predefine(TimelineNodeStatus.beforeEnd), title: "Before End", isPresent: true)
                    .modifier(CustomListRowModifier())
                TimelineMarker(timestampLabel: "06/20/24", secondaryTimestampImage: Image(systemName: "sun.max"), nodeImage: .predefine(TimelineNodeStatus.end), showLowerVerticalLine: true, title: "End")
                    .modifier(CustomListRowModifier())
                    .secondaryTimestampImageStyle(content: { config in
                        config.secondaryTimestampImage.foregroundColor(.yellow)
                    })
            }
            Section(header: Text("Timeline")) {
                Timeline(timestampLabel: "06/21/24", secondaryTimestampImage: Image(systemName: "sun.max"), nodeImage: .predefine(TimelineNodeStatus.complete), title: "Complete", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .icon(Image(systemName: "exclamationmark.circle")), subAttribute: "subAttr", isPast: true)
                    .modifier(CustomListRowModifier())
                Timeline(timestampLabel: "06/21/24", secondaryTimestampImage: Image(systemName: "sun.max"), nodeImage: .predefine(TimelineNodeStatus.complete), title: "Complete(Disabled)", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .icon(Image(systemName: "exclamationmark.circle")), subAttribute: "subAttr", isPast: true)
                    .modifier(CustomListRowModifier())
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                Timeline(timestampLabel: "06/21/24", secondaryTimestampLabel: "Sunny", nodeImage: .predefine(TimelineNodeStatus.inProgress), title: "Inprogress", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .icon(Image(systemName: "exclamationmark.circle")), subAttribute: "subAttr", isPresent: true)
                    .modifier(CustomListRowModifier())
                Timeline(timestampLabel: "06/21/24", secondaryTimestampLabel: "Sunny", nodeImage: .predefine(TimelineNodeStatus.inProgress), title: "Inprogress(Disabled)", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .icon(Image(systemName: "exclamationmark.circle")), subAttribute: "subAttr", isPresent: true)
                    .modifier(CustomListRowModifier())
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                Timeline(timestampLabel: "06/21/24", secondaryTimestampLabel: "Sunny", nodeImage: .predefine(TimelineNodeStatus.open), title: "Open", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .icon(Image(systemName: "exclamationmark.circle")), subAttribute: "subAttr")
                    .modifier(CustomListRowModifier())
                Timeline(timestampLabel: "06/21/24", secondaryTimestampLabel: "Sunny", nodeImage: .predefine(TimelineNodeStatus.open), title: "Open(Disabled)", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .icon(Image(systemName: "exclamationmark.circle")), subAttribute: "subAttr")
                    .modifier(CustomListRowModifier())
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }
            Section(header: Text("TimelineNowIndicator")) {
                TimelineNowIndicator()
                    .modifier(CustomListRowModifier())
            }
        }
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 7)
    }
}

struct CustomListRowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
            .listRowSeparator(.hidden)
    }
}

#Preview {
    TimelineItemsExample()
}

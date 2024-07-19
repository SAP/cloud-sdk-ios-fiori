import FioriSwiftUICore
import SwiftUI

struct TimelineItemsExample: View {
    var body: some View {
        List {
            Section(header: Text("TimelineMarker")) {
                TimelineMarker(timestamp: "06/20/24", secondaryTimestamp: .icon(Image(systemName: "sun.max")), timelineNode: .beforeStart, title: "Before Start", isPast: true, showUpperVerticalLine: false)
                    .modifier(CustomListRowModifier())
                    .secondaryTimestampStyle(content: { config in
                        config.secondaryTimestamp.foregroundColor(.yellow)
                    })
                TimelineMarker(timestamp: "06/20/24", secondaryTimestamp: .text("Sunny"), timelineNode: .start, title: "Start", isPresent: true)
                    .modifier(CustomListRowModifier())
                TimelineMarker(timestamp: "06/20/24", secondaryTimestamp: .text("Sunny"), timelineNode: .beforeEnd, title: "Before End", isPresent: true)
                    .modifier(CustomListRowModifier())
                TimelineMarker(timestamp: "06/20/24", secondaryTimestamp: .icon(Image(systemName: "sun.max")), timelineNode: .end, title: "End", showLowerVerticalLine: true)
                    .modifier(CustomListRowModifier())
                    .secondaryTimestampStyle(content: { config in
                        config.secondaryTimestamp.foregroundColor(.yellow)
                    })
            }
            Section(header: Text("Timeline")) {
                Timeline(timestamp: "06/21/24", secondaryTimestamp: .icon(Image(systemName: "sun.max")), timelineNode: .complete, title: "Complete", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .icon(Image(systemName: "exclamationmark.circle")), subAttribute: "subAttr", isPast: true)
                    .modifier(CustomListRowModifier())
                    .secondaryTimestampStyle(content: { config in
                        config.secondaryTimestamp.foregroundColor(.yellow)
                    })
                    .substatusStyle(content: { config in
                        config.substatus.foregroundColor(.yellow)
                    })
                Timeline(timestamp: "06/21/24", secondaryTimestamp: .icon(Image(systemName: "sun.max")), timelineNode: .complete, title: "Complete(Disabled)", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .icon(Image(systemName: "exclamationmark.circle")), subAttribute: "subAttr", isPast: true)
                    .modifier(CustomListRowModifier())
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                Timeline(timestamp: "06/21/24", secondaryTimestamp: .text("Sunny"), timelineNode: .inProgress, title: "Inprogress", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .text("Warning"), subAttribute: "subAttr", isPresent: true)
                    .modifier(CustomListRowModifier())
                    .secondaryTimestampStyle(content: { config in
                        config.secondaryTimestamp.foregroundColor(.yellow)
                    })
                    .substatusStyle(content: { config in
                        config.substatus.foregroundColor(.yellow)
                    })
                Timeline(timestamp: "06/21/24", secondaryTimestamp: .text("Sunny"), timelineNode: .inProgress, title: "Inprogress(Disabled)", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .text("Warning"), subAttribute: "subAttr", isPresent: true)
                    .modifier(CustomListRowModifier())
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                Timeline(timestamp: "06/21/24", secondaryTimestamp: .text("Sunny"), timelineNode: .open, title: "Open", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .text("Warning"), subAttribute: "subAttr")
                    .modifier(CustomListRowModifier())
                Timeline(timestamp: "06/21/24", secondaryTimestamp: .text("Sunny"), timelineNode: .open, title: "Open(Disabled)", subtitle: "abc", attribute: "attr", status: .text("Info"), substatus: .text("Warning"), subAttribute: "subAttr")
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

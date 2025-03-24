import FioriSwiftUICore
import SwiftUI

struct AttachmentExamples: View {
    var body: some View {
        List {
            Section(header: Text("Attachment")) {
                NavigationLink(
                    destination: Sandbox(),
                    label: {
                        Text("Playground")
                    }
                )

                NavigationLink(
                    destination: AttachmentGroupExample(),
                    label: {
                        Text("AttachmentGroup")
                    }
                )

                NavigationLink(
                    destination: AttachmentGroupCustomExample(),
                    label: {
                        Text("AttachmentGroup -- Custom")
                    }
                )

                NavigationLink(
                    destination: AttachmentDelegateExample(),
                    label: {
                        Text("Attachment Delegate Example")
                    }
                )

                NavigationLink(
                    destination: AttachmentPreviewExample(),
                    label: {
                        Text("Preview Examples")
                    }
                )
            }
        }
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 5)
    }
}

#Preview {
    SimpleTimelineExample()
}

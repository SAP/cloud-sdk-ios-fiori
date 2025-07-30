import FioriSwiftUICore
import SwiftUI

struct AttachmentExamples: View {
    var body: some View {
        List {
            Section(header: Text("Attachment")) {
                NavigationLink(
                    destination: AttachmentGroupExample(),
                    label: {
                        Text("Attachment")
                    }
                )

                NavigationLink(
                    destination: AttachmentGroupCustomExample(),
                    label: {
                        Text("Attachment -- Custom")
                    }
                )

                NavigationLink(
                    destination: AttachmentDelegateExample(),
                    label: {
                        Text("Attachment Delegate")
                    }
                )
                
                NavigationLink(
                    destination: MandatoryAttachmentExample(),
                    label: {
                        Text("Mandatory Attachment")
                    }
                )

                NavigationLink(
                    destination: AttachmentPreviewExample(),
                    label: {
                        Text("Previews")
                    }
                )
            }
        }
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 5)
    }
}

#Preview {
    AttachmentExamples()
}

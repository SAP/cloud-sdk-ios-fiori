import FioriSwiftUICore
import SwiftUI

struct MandatoryAttachmentExample: View {
    @State var attachments: [URL]
    @State var attachmentError: AttributedString?
    @State var mandatoryIndicator: Bool
    
    let delegate: BasicAttachmentDelegate
    
    init() {
        var myAttachments: [URL] = []
        self.delegate = BasicAttachmentDelegate(localFolderName: "customMandatoryAttachments") { folder in
            myAttachments = BasicAttachmentDelegate.copy(
                attachments: [
                ].compactMap { $0 },
                to: folder
            )
        }
        self.attachments = myAttachments
        self.attachmentError = nil
        self.mandatoryIndicator = true
    }
    
    var body: some View {
        ScrollView {
            Toggle(self.mandatoryIndicator ? "Use *" : "Use icon", isOn: self.$mandatoryIndicator)
                .pickerStyle(.segmented)
                .padding(.horizontal)
            VStack {
                AttachmentGroup(
                    title: { self.title },
                    attachments: self.$attachments,
                    maxCount: 5,
                    delegate: self.delegate,
                    errorMessage: self.$attachmentError,
                    operations: {
                        AttachmentButtonImage()
                            .operationsMenu {
                                PhotosPickerMenuItem(filter: [.images])
                                FilesPickerMenuItem(filter: [.pdf, .presentation])
                            }
                    }
                )
            }
        }
    }
    
    var title: some View {
        HStack {
            if self.mandatoryIndicator {
                Text("Attachments") +
                    Text("*")
                    .foregroundStyle(.red)
                Text("(\(self.attachments.count))")
                
            } else {
                Text("Attachments")
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                    .accessibilityLabel(Text(", mandatory field"))
                Text("(\(self.attachments.count))")
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Attachments, mandatory field, \(self.numberOfAttachments).")
    }
    
    var numberOfAttachments: String {
        self.attachments.count > 1 ? " \(self.attachments.count) files uploaded" : " \(self.attachments.count) file uploaded"
    }
}

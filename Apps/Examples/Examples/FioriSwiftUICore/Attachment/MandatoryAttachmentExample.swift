import FioriSwiftUICore
import SwiftUI

struct MandatoryAttachmentExample: View {
    @State var attachments: [URL]
    @State var attachmentError: AttributedString?
    @State var mandatoryIndicator: Bool
    
    @State var defaultMandatoryFieldIndicator = false
    @State var isLongTitle = false
    
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
            Toggle("Default Mandatory Field Indicator", isOn: self.$defaultMandatoryFieldIndicator)
                .pickerStyle(.segmented)
                .padding(.horizontal)
            if !self.defaultMandatoryFieldIndicator {
                Toggle(self.mandatoryIndicator ? "Use *" : "Use icon", isOn: self.$mandatoryIndicator)
                    .pickerStyle(.segmented)
                    .padding(.horizontal)
            }
            Toggle("Long title", isOn: self.$isLongTitle)
                .pickerStyle(.segmented)
                .padding(.horizontal)
            
            VStack {
                if self.defaultMandatoryFieldIndicator {
                    AttachmentGroup(
                        title: AttributedString("\(self.longTitleStr) (\(self.attachments.count))"),
                        isRequired: self.defaultMandatoryFieldIndicator,
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
                } else {
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
    }
    
    var title: some View {
        HStack {
            if self.mandatoryIndicator {
                Text(self.longTitleStr) +
                    Text("*")
                    .foregroundStyle(.red) +
                    Text("(\(self.attachments.count))")
                
            } else {
                Text(self.longTitleStr) +
                    Text(Image(systemName: "exclamationmark.triangle.fill"))
                    .foregroundColor(.red)
                    .accessibilityLabel(Text(", mandatory field")) +
                    Text("(\(self.attachments.count))")
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(self.longTitleStr), mandatory field, \(self.numberOfAttachments).")
    }
    
    var numberOfAttachments: String {
        self.attachments.count > 1 ? " \(self.attachments.count) files uploaded" : " \(self.attachments.count) file uploaded"
    }
    
    var longTitleStr: String {
        self.isLongTitle ? "Attachments long long long long long long long long long long title" : "Attachments"
    }
}

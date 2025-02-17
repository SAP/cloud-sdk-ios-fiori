import FioriSwiftUICore
import PhotosUI
import SwiftUI

struct AttachmentGroupExample: View {
    @State var urls = [
        Bundle.main.url(forResource: "Text File Example", withExtension: "txt")!,
        Bundle.main.url(forResource: "XML File Example", withExtension: "xml")!,
        Bundle.main.url(forResource: "HTML File Example", withExtension: "html")!
    ]
    
    @State private var maxCount: Int = 5
    
    @State private var showOperations = false
    
    @State var images = [UIImage]()
    @State var selectedPhotos = [PhotosPickerItem]()
    
    @State var showScanAndUploadView = false
    @State var showWriteAndUploadView = false
    
    @State private var opsAsMenu = true
    
    @State var previewURL: URL? = nil
    var shouldShowPreview: Binding<Bool> {
        Binding<Bool> {
            self.previewURL != nil
        } set: {
            if $0 == false {
                self.previewURL = nil
            }
        }
    }

    @State private var defaultPreview = true
    
    @State private var error: AttributedString? = nil
    
    var body: some View {
        ScrollView {
            VStack {
                Stepper("Max Number of Attachments \(self.maxCount)", value: self.$maxCount)
                    .padding([.leading, .trailing], 8)

                Toggle(self.opsAsMenu ? "Operation Menu" : "Operation Dialog", isOn: self.$opsAsMenu)
                    .padding([.leading, .trailing], 8)
                Toggle(self.defaultPreview ? "SwiftUI QuickLookPreview" : "Custom Preview", isOn: self.$defaultPreview)
                    .padding([.leading, .trailing], 8)

                if self.opsAsMenu {
                    self.attachmentWithOpsAsMenu()
                } else {
                    self.attachmentWithOpsAsDialog()
                }
            }
            .sheet(isPresented: self.$showScanAndUploadView) {
                ScanUploadView { attachmentName, attachmentContent in
                    print("Upload scaned attachment: \(attachmentName), \(attachmentContent)")
                    self.showScanAndUploadView.toggle()
                }
            }
            .sheet(isPresented: self.$showWriteAndUploadView) {
                WriteAndUploadView { attachmentName, attachmentContent in
                    print("Upload adhoc attachment: \(attachmentName), \(attachmentContent)")
                    self.showWriteAndUploadView.toggle()
                }
            }
            .padding()
        }
    }
    
    @ViewBuilder
    func attachmentWithOpsAsMenu() -> some View {
        if self.defaultPreview {
            self.attachmentWithDefaultPreview
        } else {
            self.attachmentWithCustomPreview
        }
    }
    
    @ViewBuilder
    func attachmentWithOpsAsDialog() -> some View {
        if self.defaultPreview {
            self.attachmentWithDefaultPreview
        } else {
            self.attachmentWithCustomPreview
        }
    }
    
    var attachmentWithDefaultPreview: some View {
        AttachmentGroup(title: { Text("Attachments") }, attachments: self.$urls, maxCount: self.maxCount, errorMessage: self.$error) {
            AttachmentButtonImage()
                .operationsDialog {
                    AttachmentMenuItems.photos
                    AttachmentMenuItems.files
                    AttachmentMenuItems.camera
                    Button {
                        self.showScanAndUploadView.toggle()
                    } label: {
                        Label("Scan & Upload", image: "doc.viewfinder")
                    }
                    Button {
                        self.showWriteAndUploadView.toggle()
                    } label: {
                        Label("Compose and Upload", image: "square.and.pencil")
                    }
                }
        }
    }
    
    var attachmentWithCustomPreview: some View {
        AttachmentGroup(title: { Text("Attachments") }, attachments: self.$urls, maxCount: self.maxCount, errorMessage: self.$error) {
            AttachmentButtonImage()
                .operationsDialog {
                    AttachmentMenuItems.photos
                    AttachmentMenuItems.files
                    AttachmentMenuItems.camera
                    Button {
                        self.showScanAndUploadView.toggle()
                    } label: {
                        Label("Scan & Upload", image: "doc.viewfinder")
                    }
                    Button {
                        self.showWriteAndUploadView.toggle()
                    } label: {
                        Label("Compose and Upload", image: "square.and.pencil")
                    }
                }
        } onPreview: { url in
            self.previewURL = url
        }
        .fullScreenCover(isPresented: self.shouldShowPreview) {
            AttachmentPreview(
                urls: self.$urls,
                previewURL: Binding<URL>(get: { self.previewURL ?? URL(fileURLWithPath: "/dev/null") }, set: { self.previewURL = $0 })
            ) { url in
                print("Delete atttachment \(url)")
                self.urls.removeAll { $0 == url }
            } onDismiss: {
                self.previewURL = nil
            }
        }
    }
}

struct ScanUploadView: View {
    let doneAction: (String, Data) -> Void
    @State private var attachmentName: String = "MyScannedDoc.pdf"
    @State private var content: Data?
    var body: some View {
        VStack(alignment: .leading) {
            Text("Scan Upload")
                .font(.title)
                .foregroundStyle(.blue)
            TextField("Attachment name", text: self.$attachmentName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Image(systemName: "qrcode")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(.blue)
            Button("Upload") {
                self.doneAction(self.attachmentName, self.content ?? Data())
            }
            .disabled(self.attachmentName.isEmpty) // || content == nil
            Spacer()
        }
        .padding()
    }
}

struct WriteAndUploadView: View {
    @State private var attachmentName = "MyTextDoc.txt"
    @State private var content: String = ""
    let onDone: (String, String) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Write and Upload")
                .font(.title)
                .foregroundStyle(.blue)
            TextField("Attachment name", text: self.$attachmentName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Write something here...", text: self.$content, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.leading)
                .lineLimit(10 ... 30)
            Button("Done") {
                self.onDone(self.attachmentName, self.content)
            }
            .disabled(self.attachmentName.isEmpty || self.content.isEmpty)
            Spacer()
        }
        .padding()
    }
}

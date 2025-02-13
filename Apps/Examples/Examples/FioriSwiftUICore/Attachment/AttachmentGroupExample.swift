import FioriSwiftUICore
import PhotosUI
import SwiftUI

struct AttachmentGroupExample: View {
    @State var urls = [
        Bundle.main.url(forResource: "Text File Example", withExtension: "txt")!,
        Bundle.main.url(forResource: "XML File Example", withExtension: "xml")!,
        Bundle.main.url(forResource: "HTML File Example", withExtension: "html")!,
        URL(string: "https://ace.com/My Sound.8svx")!,
        URL(string: "https://ace.com/My Image.bpg")!,
//        URL(string: "https://ace.com/My PDF.pdf")!,
//        URL(string: "https://ace.com/My Presentation.pptm")!,
        URL(string: "https://ace.com/My Video.f4b")!,
        URL(string: "https://ace.com/My Text.rtf")!,
        URL(string: "https://ace.com/My Document/")!
    ]
    
    @State var previewUrl: URL? = nil
    
    @State var previewIndex: Int = 0
    
    @State private var showOperations = false
    
    @State var images = [UIImage]()
    @State var selectedPhotos = [PhotosPickerItem]()
    
    @State var showScanAndUploadView = false
    @State var showWriteAndUploadView = false
    
    @State private var opsAsMenu = true
    
    @State private var defaultPreview = true

    var body: some View {
        ScrollView {
            VStack {
                Toggle(self.opsAsMenu ? "Operation Menu" : "Operation Dialog", isOn: self.$opsAsMenu)
                    .padding()
                Toggle(self.defaultPreview ? "SwiftUI QuickLookPreview" : "Custom Preview", isOn: self.$defaultPreview)
                    .padding()
                
                if self.opsAsMenu {
                    self.attachmentWithOpsAsMenu()
                } else {
                    self.attachmentWithOpsAsDialog()
                }
            }
            .padding()
            .modifier {
                if self.defaultPreview {
                    // default SwiftUI QuickLookPreivew
                    $0.quickLookPreview(self.$previewUrl, in: self.$urls.wrappedValue)
                } else {
                    // custom preview
                    $0.fullScreenCover(isPresented: self.shouldShowPreview) {
                        AttachmentPreview(urls: self.$urls, previewIndex: self.$previewIndex) { index in
                            print("Delete atttachment \(index)")
                            self.urls.remove(at: index)
                        } onDismiss: {
                            self.previewUrl = nil
                        }
                    }
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
        }
    }
    
    @ViewBuilder
    func attachmentWithOpsAsMenu() -> some View {
        AttachmentGroup(readonly: true, maxCount: 20, urls: self.$urls) {
            self.previewIndex = $0
            self.previewUrl = self.urls[self.previewIndex]
        } menu: {
            AttachmentButtonImage()
                .operationsMenu {
                    AttachmentMenuItems.photos
                    AttachmentMenuItems.files
                    AttachmentMenuItems.camera
                    Button {
                        self.showScanAndUploadView.toggle()
                    } label: {
                        Label("Scan & Upload", systemImage: "doc.viewfinder")
                    }
                    Button {
                        self.showWriteAndUploadView.toggle()
                    } label: {
                        Label("Compose and Upload", systemImage: "square.and.pencil")
                    }
                }
        } onAdd: { _ in
            
        } onDelete: { index in
            self.urls.remove(at: index)
            // delete physical file here
        }
    }
    
    @ViewBuilder
    func attachmentWithOpsAsDialog() -> some View {
        AttachmentGroup(readonly: true, maxCount: 20, urls: self.$urls) {
            self.previewIndex = $0
            self.previewUrl = self.urls[self.previewIndex]
        } menu: {
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
        } onAdd: { _ in
            
        } onDelete: { index in
            self.urls.remove(at: index)
            // delete physical file here
        }
    }
    
    var shouldShowPreview: Binding<Bool> {
        Binding<Bool> {
            self.previewUrl != nil
        } set: {
            if $0 == false {
                self.previewUrl = nil
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

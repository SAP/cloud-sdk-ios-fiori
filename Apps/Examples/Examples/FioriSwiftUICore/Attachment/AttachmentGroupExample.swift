import FioriSwiftUICore
import PhotosUI
import SwiftUI

struct AttachmentGroupExample: View {
    @State var urls = [
        Bundle.main.url(forResource: "Text File Example", withExtension: "txt")!,
        Bundle.main.url(forResource: "XML File Example", withExtension: "xml")!,
        Bundle.main.url(forResource: "HTML File Example", withExtension: "html")!
    ]
    
    @State private var maxCount: Int? = nil

    @State private var state: ControlState = .normal

    @State private var showOperations = false
    
    @State var images = [UIImage]()
    @State var selectedPhotos = [PhotosPickerItem]()
    
    @State var showScanAndUploadView = false
    @State var showWriteAndUploadView = false
    
    @State private var opsAsMenu = true
    
    @State private var showConfiguraton = false
    
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
    
    @State private var defaultThumbnail: Bool = true

    @State private var defaultPreview = true
    
    @State private var error: AttributedString? = nil
    @State private var appWithoutError: Bool = true
    
    @State var photoFilters: [PHPickerFilter] = []
    @State var fileFilters: [UTType] = []
    
    var body: some View {
        ScrollView {
            VStack {
                self.attachments()
                    .border(.red)
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
        .onChange(of: self.appWithoutError) { _, newValue in
            if !newValue {
                self.error = AttributedString("Mimic an attachemnt processing error.")
            } else {
                self.error = nil
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    self.showConfiguraton.toggle()
                } label: {
                    Image(systemName: "gearshape")
                }
                .popover(isPresented: self.$showConfiguraton) {
                    VStack {
                        Button("Close") {
                            self.showConfiguraton.toggle()
                        }
                        
                        Picker("State", selection: self.$state) {
                            Text("Normal").tag(ControlState.normal)
                            Text("Disabled").tag(ControlState.disabled)
                            Text("Readonly").tag(ControlState.readOnly)
                        }
                        .pickerStyle(.segmented)
                        
                        Stepper("Max # \(self.maxCount != nil ? String(self.maxCount!) : "nil")",
                                value: Binding<Int>(get: { self.maxCount ?? self.urls.count + 3 }, set: { self.maxCount = $0 < self.urls.count ? nil : $0 }))
                        
                        Toggle(self.opsAsMenu ? "Operation Menu" : "Operation Dialog", isOn: self.$opsAsMenu)
                        
                        Toggle(self.defaultPreview ? "SwiftUI QuickLookPreview" : "Custom Preview", isOn: self.$defaultPreview)
                        
                        Toggle(self.defaultThumbnail ? "Use Default Thumbnail & Info" : "Use My Own Thumbnail & Info", isOn: self.$defaultThumbnail)
                        
                        Toggle(self.appWithoutError ? "No App Error" : "Somehow, App Caused An Error", isOn: self.$appWithoutError)
                        
                        FilterCFG(photoFilters: self.$photoFilters, fileFilters: self.$fileFilters)
                        Spacer()
                    }
                    .padding()
                }
            }
        }
    }
    
    @ViewBuilder
    func attachments() -> some View {
        AttachmentGroup(
            title: { Text("Attachments \(self.urls.count)") },
            attachments: self.$urls,
            maxCount: self.maxCount,
            controlState: self.state,
            errorMessage: self.$error,
            operations: {
                AttachmentButtonImage(controlState: self.state)
                    .ifApply(self.opsAsMenu) {
                        $0.operationsMenu {
                            AttachmentMenuItems.photos(filter: self.photoFilters)
                            AttachmentMenuItems.files(filter: self.fileFilters)
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
                    }
                    .ifApply(!self.opsAsMenu) {
                        $0.operationsDialog {
                            AttachmentMenuItems.photos(filter: self.photoFilters)
                            AttachmentMenuItems.files(filter: self.fileFilters)
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
                    }
            },
            onPreview: self.defaultPreview ? nil : { newValue in
                print("Custom preview: \(newValue)")
                self.previewURL = newValue
            }
        )
        .ifApply(!self.defaultPreview) {
            $0.fullScreenCover(isPresented: self.shouldShowPreview) {
                if self.state == .normal {
                    AttachmentPreview(
                        urls: self.$urls,
                        previewURL: Binding<URL>(get: { self.previewURL ?? URL(fileURLWithPath: "/dev/null") }, set: { self.previewURL = $0 })
                    ) { url in
                        print("Delete atttachment \(url)")
                        self.urls.removeAll { $0 == url }
                    } onDismiss: {
                        self.previewURL = nil
                    }
                } else {
                    AttachmentPreview(
                        urls: self.$urls,
                        previewURL: Binding<URL>(get: { self.previewURL ?? URL(fileURLWithPath: "/dev/null") }, set: { self.previewURL = $0 }), onDismiss: {
                            self.previewURL = nil
                        }
                    )
                }
            }
        }
        .ifApply(!self.defaultThumbnail) {
            $0.attachmentStyle(MyAttachmentStyle())
        }
    }
}

struct MyAttachmentStyle: AttachmentStyle {
    public func makeBody(_ configuration: AttachmentConfiguration) -> some View {
        VStack {
            RoundedRectangle(cornerRadius: AttachmentConstants.cellCornerRadius)
                .fill(
                    Color(
                        red: .random(in: 0 ... 1),
                        green: .random(in: 0 ... 1),
                        blue: .random(in: 0 ... 1),
                        opacity: .random(in: 0 ... 1)
                    )
                )
                .frame(width: AttachmentConstants.cellWidth, height: AttachmentConstants.cellHeight)

            Text("* < Not  Visible> *")
                .font(.caption)
                .foregroundStyle(.red)
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

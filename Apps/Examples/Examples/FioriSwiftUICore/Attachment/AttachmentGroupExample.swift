import FioriSwiftUICore
import PhotosUI
import SwiftUI

struct AttachmentGroupExample: View {
    @State var urls: [URL]
    @State private var maxCount: Int?
    @State private var state: ControlState
    @State private var showOperations: Bool
    @State var images: [UIImage]
    @State var selectedPhotos: [PhotosPickerItem]
    @State var showWriteAndUploadView: Bool
    @State private var opsAsMenu = true
    @State private var showConfiguraton = false
    @State var previewURL: URL? = nil
    @State private var defaultThumbnail: Bool
    @State private var defaultPreview: Bool
    @State private var error: AttributedString?
    @State private var appWithoutError: Bool
    @State var photoFilters: [PHPickerFilter] = []
    @State var fileFilters: [UTType] = []

    var shouldShowPreview: Binding<Bool> {
        Binding<Bool> {
            self.previewURL != nil
        } set: {
            if $0 == false {
                self.previewURL = nil
            }
        }
    }

    init() {
        self.urls = []
        self.maxCount = nil
        self.state = .normal
        self.opsAsMenu = true
        self.showOperations = false
        self.images = []
        self.selectedPhotos = []
        self.showWriteAndUploadView = false
        self.showConfiguraton = false
        self.previewURL = nil
        self.defaultThumbnail = true
        self.defaultPreview = true
        self.error = nil
        self.appWithoutError = true
        self.photoFilters = []
        self.fileFilters = []
    }
    
    var body: some View {
        ScrollView {
            VStack {
                self.attachments()
                    .border(.red)
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
        .onAppear {
            do {
                let mgr = FileManager.default
                let folder = mgr.temporaryDirectory.appendingPathComponent(BasicAttachmentDelegate.demoFolderName, isDirectory: true)
                try mgr.removeItem(at: folder)
                
                if !mgr.fileExists(atPath: folder.path) {
                    try mgr.createDirectory(at: folder, withIntermediateDirectories: true, attributes: nil)
                }
                
                var urls: [URL] = []
                try [
                    Bundle.main.url(forResource: "Text File Example", withExtension: "txt"),
                    Bundle.main.url(forResource: "XML File Example", withExtension: "xml"),
                    Bundle.main.url(forResource: "HTML File Example", withExtension: "html")
                ].compactMap { $0 }.forEach {
                    try mgr.copyItem(at: $0, to: folder.appendingPathComponent($0.lastPathComponent))
                    urls.append(folder.appendingPathComponent($0.lastPathComponent))
                }
                
                self.urls.append(contentsOf: urls)
            } catch {
                print("Error preparing demo folder: \(error)")
            }
        }
        .onDisappear {
            do {
                let mgr = FileManager.default
                let folder = mgr.temporaryDirectory.appendingPathComponent(BasicAttachmentDelegate.demoFolderName, isDirectory: true)
                try mgr.removeItem(at: folder)
                
            } catch {
                print("Error deleting folder: \(error)")
            }
        }
    }
    
    @ViewBuilder
    func attachments() -> some View {
        AttachmentGroup(
            title: { Text("Attachments (\(self.urls.count))") },
            attachments: self.$urls,
            maxCount: self.maxCount,
            controlState: self.state,
            errorMessage: self.$error,
            operations: {
                AttachmentButtonImage(controlState: self.state)
                    .ifApply(self.opsAsMenu) {
                        $0.operationsMenu {
                            PhotosPickerMenuItem(filter: self.photoFilters)
                            FilesPickerMenuItem(filter: self.fileFilters)
                            CameraMenuItem()
                            PdfScannerMenuItem()
                            Button {
                                self.showWriteAndUploadView.toggle()
                            } label: {
                                Label("Compose", systemImage: "square.and.pencil")
                            }
                        }
                    }
                    .ifApply(!self.opsAsMenu) {
                        $0.operationsDialog {
                            PhotosPickerMenuItem(filter: self.photoFilters)
                            FilesPickerMenuItem(filter: self.fileFilters)
                            CameraMenuItem()
                            PdfScannerMenuItem()
                            Button {
                                self.showWriteAndUploadView.toggle()
                            } label: {
                                Label("Compose", systemImage: "square.and.pencil")
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
                AttachmentPreview(
                    urls: self.$urls,
                    previewURL: Binding<URL>(get: { self.previewURL ?? URL(fileURLWithPath: "/dev/null") }, set: { self.previewURL = $0 }),
                    controlState: self.$state
                ) { url in
                    print("Delete atttachment \(url)")
                    self.urls.removeAll { $0 == url }
                } onDismiss: {
                    self.previewURL = nil
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
            RoundedRectangle(cornerRadius: AttachmentConstants.thumbnailCornerRadius)
                .fill(
                    Color(
                        red: .random(in: 0 ... 1),
                        green: .random(in: 0 ... 1),
                        blue: .random(in: 0 ... 1),
                        opacity: .random(in: 0 ... 1)
                    )
                )
                .frame(width: AttachmentConstants.thumbnailWidth, height: AttachmentConstants.thumbnailHeight)

            Text("* < Not  Visible> *")
                .font(.caption)
                .foregroundStyle(.red)
        }
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

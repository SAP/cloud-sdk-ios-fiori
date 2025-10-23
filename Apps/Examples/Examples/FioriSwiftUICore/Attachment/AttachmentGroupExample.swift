import FioriSwiftUICore
import FioriThemeManager
import PhotosUI
import SwiftUI

struct AttachmentGroupExample: View {
    @State var attachmentInfo: [AttachmentInfo]
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
    @State private var defaultGridLayout: Bool
    @State private var defaultPreview: Bool
    @State private var error: AttributedString?
    @State private var appWithoutError: Bool
    @State var photoFilters: [PHPickerFilter] = []
    @State var fileFilters: [UTType] = []
    @State private var bulkProcessingDisabled: Bool
    @State private var showExtranInfo: Bool
    @State private var useDemoDelegate: Bool

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
        self.attachmentInfo = []
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
        self.defaultGridLayout = true
        self.bulkProcessingDisabled = false
        self.showExtranInfo = false
        self.useDemoDelegate = false
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
            Spacer()
            HStack {
                Button("Batch") {
                    Task {
                        self.bulkProcessingDisabled.toggle()
                        await withTaskGroup { group in
                            for index in self.attachmentInfo.indices {
                                let url = self.attachmentInfo[index].primaryURL
                                group.addTask {
                                    await MainActor.run {
                                        self.attachmentInfo[index] = .uploading(sourceURL: url)
                                    }
                                    
                                    try? await Task.sleep(nanoseconds: [1000000000, 3000000000, 5000000000].randomElement() ?? 3000000000)

                                    await MainActor.run {
                                        if Bool.random() {
                                            self.attachmentInfo[index] = .uploaded(destinationURL: url, sourceURL: url, extraInfo: self.showExtranInfo ? MyExtraInfo.random() : nil)
                                        } else {
                                            self.attachmentInfo[index] = .error(sourceURL: url, message: ["Simulated error uploading this file.", "Simulated error uploading this file. More to test longer error message."].randomElement() ?? "Simulated error uploading this file.")
                                        }
                                    }
                                }
                            }
                        }
                        self.bulkProcessingDisabled.toggle()
                    }
                }
                .disabled(self.bulkProcessingDisabled)
                Spacer()
                Button("Rest") {
                    self.bulkProcessingDisabled.toggle()
                    self.attachmentInfo = self.attachmentInfo.map {
                        .uploaded(destinationURL: $0.primaryURL, sourceURL: $0.primaryURL, extraInfo: self.showExtranInfo ? MyExtraInfo.random() : nil)
                    }
                    self.bulkProcessingDisabled.toggle()
                }
                .disabled(self.bulkProcessingDisabled)
            }
            .padding()
            .border(.blue)
        }
        .onChange(of: self.appWithoutError) { _, newValue in
            if !newValue {
                self.error = AttributedString("Mimic an attachemnt processing error.")
            } else {
                self.error = nil
            }
        }
        .onChange(of: self.showExtranInfo) { _, newValue in
            self.attachmentInfo = self.attachmentInfo.map { AttachmentInfo.uploaded(destinationURL: $0.primaryURL, sourceURL: $0.primaryURL, extraInfo: newValue ? MyExtraInfo.random() : nil) }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
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
                                value: Binding<Int>(get: { self.maxCount ?? self.attachmentInfo.count + 3 }, set: { self.maxCount = $0 < self.attachmentInfo.count ? nil : $0 }))
                        
                        Toggle(self.opsAsMenu ? "Operation Menu" : "Operation Dialog", isOn: self.$opsAsMenu)

                        Toggle(self.useDemoDelegate ? "Slow Upload with Random Error Demo" : "Faster BasicAttachmentDelegate", isOn: self.$useDemoDelegate)

                        #if os(iOS)
                            Toggle(self.defaultPreview ? "SwiftUI QuickLookPreview" : "Custom Preview", isOn: self.$defaultPreview)
                        #endif
                        
                        Toggle(self.defaultGridLayout ? "Use Grid Layout" : "Use List Layout", isOn: self.$defaultGridLayout)

                        Toggle(self.defaultThumbnail ? "Use Default Thumbnail & Info" : "Use My Own Thumbnail & Info", isOn: self.$defaultThumbnail)

                        if !self.defaultThumbnail || !self.defaultGridLayout {
                            Toggle(self.showExtranInfo ? "Show Extra Info" : "No Extra Info", isOn: self.$showExtranInfo)
                        }

                        Toggle(self.appWithoutError ? "No App Error" : "Somehow, App Caused An Error", isOn: self.$appWithoutError)
                        
                        FilterCFG(photoFilters: self.$photoFilters, fileFilters: self.$fileFilters)
                        Spacer()
                    }
                    .padding()
                }
            }
        }
        .task {
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
                
                self.attachmentInfo.append(contentsOf: urls.map { AttachmentInfo.uploaded(destinationURL: $0, sourceURL: $0, extraInfo: nil) })
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
            title: { Text("Attachments (\(self.attachmentInfo.count))") },
            attachments: self.$attachmentInfo,
            maxCount: self.maxCount,
            delegate: self.useDemoDelegate ? MyAttachmentDelegateForInProgressAndErrorDemo() : BasicAttachmentDelegate(),
            controlState: self.state,
            errorMessage: self.$error,
            operations: {
                AttachmentButtonImage(controlState: self.state)
                    .ifApply(self.opsAsMenu) {
                        $0.operationsMenu {
                            PhotosPickerMenuItem(filter: self.photoFilters)
                            FilesPickerMenuItem(filter: self.fileFilters)
                            #if os(iOS)
                                CameraMenuItem()
                                PdfScannerMenuItem()
                                Button {
                                    self.showWriteAndUploadView.toggle()
                                } label: {
                                    Label("Custom:Compose", systemImage: "square.and.pencil")
                                }
                            #endif
                        }
                    }
                    .ifApply(!self.opsAsMenu) {
                        $0.operationsDialog {
                            PhotosPickerMenuItem(filter: self.photoFilters)
                            FilesPickerMenuItem(filter: self.fileFilters)
                            #if os(iOS)
                                CameraMenuItem()
                                PdfScannerMenuItem()
                                Button {
                                    self.showWriteAndUploadView.toggle()
                                } label: {
                                    Label("Custom:Compose", systemImage: "square.and.pencil")
                                }
                            #endif
                        }
                    }
            },
            onPreview: self.defaultPreview ? nil : { newValue in
                print("Custom preview: \(newValue)")
                self.previewURL = newValue
            },
            defaultAttachmentExtraInfo: self.showExtranInfo ? { MyExtraInfo.random() } : nil
        )
        #if os(iOS)
        .ifApply(!self.defaultPreview) {
            $0.fullScreenCover(isPresented: self.shouldShowPreview) {
                AttachmentPreview(
                    attachmentInfo: self.$attachmentInfo,
                    previewURL: Binding<URL>(get: { self.previewURL ?? URL(fileURLWithPath: "/dev/null") }, set: { self.previewURL = $0 }),
                    controlState: self.$state
                ) { url in
                    print("Delete atttachment \(url)")
                    self.attachmentInfo.removeAll { $0.primaryURL == url }
                } onDismiss: {
                    self.previewURL = nil
                }
            }
        }
        #endif
        .ifApply(!self.defaultThumbnail && self.defaultGridLayout) {
            $0.attachmentStyle(MyAttachmentStyle())
        }
        .ifApply(!self.defaultThumbnail && !self.defaultGridLayout) {
            $0.attachmentGroupStyle(MyAttachmentGroupStyle())
        }
    }
}

struct MyAttachmentStyle: AttachmentStyle {
    public func makeBody(_ configuration: AttachmentConfiguration) -> some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: AttachmentConstants.thumbnailCornerRadius)
                    .fill(
                        Color(
                            red: .random(in: 0 ... 1),
                            green: .random(in: 0 ... 1),
                            blue: .random(in: 0 ... 1),
                            opacity: .random(in: 0 ... 1)
                        )
                    )
                self.getExtraInfoView(configuration)
            }
            .frame(width: AttachmentConstants.thumbnailWidth, height: AttachmentConstants.thumbnailHeight)
            
            Text("* < Not  Visible> *")
                .font(.caption)
                .foregroundStyle(.red)
        }
        .frame(width: AttachmentConstants.thumbnailWidth)
    }
    
    @ViewBuilder
    func getExtraInfoView(_ configuration: AttachmentConfiguration) -> some View {
        switch configuration.attachmentInfo {
        case .uploaded(_, _, let extraInfo):
            if let extraInfo = extraInfo as? MyExtraInfo {
                if let bValue = extraInfo.boolValue {
                    self.getExtraInfoView(configuration, value: bValue)
                } else if let iValue = extraInfo.intValue {
                    self.getExtraInfoView(configuration, value: iValue)
                } else {
                    EmptyView()
                }
            } else {
                EmptyView()
            }
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    func getExtraInfoView(_ configuration: AttachmentConfiguration, value: Bool) -> some View {
        VStack(alignment: .center) {
            Toggle("", isOn: Binding<Bool>(
                get: {
                    value
                },
                set: {
                    switch configuration.attachmentInfo {
                    case .uploading, .error:
                        return
                    case .uploaded:
                        configuration.onExtraInfoChange?(MyExtraInfo.create(extraInfo: $0))
                    }
                }
            ))
            .controlSize(ControlSize.mini)
            .labelsHidden()
            .scaleEffect(0.75)

            Text("Shared")
                .font(.caption)
                .foregroundStyle(.red)
                .lineLimit(2)
        }
    }

    @ViewBuilder
    func getExtraInfoView(_ configuration: AttachmentConfiguration, value: Int) -> some View {
        VStack(alignment: .center) {
            HStack {
                Stepper("", value: Binding<Int>(
                    get: {
                        value
                    },
                    set: {
                        switch configuration.attachmentInfo {
                        case .uploading, .error:
                            return
                        case .uploaded:
                            configuration.onExtraInfoChange?(MyExtraInfo.create(extraInfo: $0))
                        }
                    }
                ), in: 0 ... 100)
                    .labelsHidden()
                    .controlSize(ControlSize.mini)
                    .scaleEffect(0.75)
            }
            
            Text("Count: \(value)")
                .font(.caption)
                .foregroundStyle(.red)
                .lineLimit(2)
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

struct MyAttachmentGroupStyle: AttachmentGroupStyle {
    @State private var showingConfirmation = false
    @State var previewURL: URL? = nil
    @State var deleteIndex: Int? = nil
    
    @ViewBuilder
    func makeAttachemnt(of configuration: AttachmentGroupConfiguration, at index: Int) -> some View {
        if let (name, fileSize, _) = getFileInfo(fileUrl: configuration.attachments[index].primaryURL) {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(name)")
                        .font(.footnote)
                        .foregroundStyle(.blue)
                    if let fileSize {
                        Text(format(size: fileSize))
                            .font(.footnote)
                            .foregroundStyle(.blue)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                self.getExtraInfoView(configuration, at: index)
                
                FioriIcon.actions.delete.padding(.horizontal)
                    .onTapGesture {
                        configuration.context.delete(attachment: configuration.attachments[index].primaryURL)
                    }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.blue, lineWidth: 2)
            )
        } else {
            EmptyView()
        }
    }

    @ViewBuilder
    func getExtraInfoView(_ configuration: AttachmentGroupConfiguration, at index: Int) -> some View {
        if case .uploaded(_, _, let extraInfo) = configuration.attachments[index] {
            if let extraInfo = extraInfo as? MyExtraInfo {
                if let bValue = extraInfo.boolValue {
                    self.getSwitch(configuration, at: index, value: bValue)
                } else if let iValue = extraInfo.intValue {
                    self.getStepper(configuration, at: index, value: iValue)
                }
            }
        } else {
            EmptyView()
        }
    }
    
    @ViewBuilder
    func getSwitch(_ configuration: AttachmentGroupConfiguration, at index: Int, value: Bool) -> some View {
        HStack {
            VStack {
                Text("Shared?")
                    .font(.footnote)
                    .foregroundStyle(.blue)
                Toggle("Shared?", isOn: Binding<Bool>(
                    get: {
                        if case .uploaded = configuration.attachments[index] {
                            return value
                        } else {
                            return false
                        }
                    },
                    set: {
                        switch configuration.attachments[index] {
                        case .uploading, .error:
                            break
                        case .uploaded(let destinationURL, let sourceURL, _):
                            configuration.attachments[index] = .uploaded(destinationURL: destinationURL, sourceURL: sourceURL, extraInfo: MyExtraInfo.create(extraInfo: $0))
                        }
                    }
                ))
                .labelsHidden()
            }
        }
    }
    
    @ViewBuilder
    func getStepper(_ configuration: AttachmentGroupConfiguration, at index: Int, value: Int) -> some View {
        HStack {
            VStack {
                Text("Count: \(value)")
                    .font(.footnote)
                    .foregroundStyle(.blue)
                Stepper("", value: Binding<Int>(
                    get: {
                        value
                    },
                    set: {
                        switch configuration.attachments[index] {
                        case .uploading, .error:
                            return
                        case .uploaded(let destinationURL, let sourceURL, _):
                            configuration.attachments[index] = .uploaded(destinationURL: destinationURL, sourceURL: sourceURL, extraInfo: MyExtraInfo.create(extraInfo: $0))
                        }
                    }
                ), in: 0 ... 100)
                    .labelsHidden()
                    .controlSize(ControlSize.mini)
                    .scaleEffect(0.75)
            }
        }
    }

    public func makeBody(_ configuration: AttachmentGroupConfiguration) -> some View {
        VStack(alignment: .leading, spacing: AttachmentConstants.cellVerticalSpacing) {
            configuration.title
                .accessibilityIdentifier("Attachment:Title-\(configuration.title)-\(UUID().uuidString)")
                .padding(.bottom, AttachmentConstants.extraTitleBottomPadding)
    
            ForEach(0 ..< configuration.attachments.count, id: \.self) { index in
                switch configuration.attachments[index] {
                case .uploaded:
                    self.makeAttachemnt(of: configuration, at: index)
                case .uploading(let sourceURL):
                    HStack {
                        VStack(alignment: .leading) {
                            ProgressView()
                            Text(sourceURL.lastPathComponent)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        FioriIcon.actions.delete.padding(.horizontal)
                            .onTapGesture {
                                configuration.context.delete(attachment: configuration.attachments[index].primaryURL)
                            }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                case .error(let sourceURL, let message):
                    HStack {
                        VStack(alignment: .leading) {
                            Text(sourceURL.lastPathComponent)
                                .font(.footnote)
                                .foregroundStyle(.red)
                            Text(message)
                                .font(.footnote)
                                .foregroundStyle(.red)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        FioriIcon.actions.delete.padding(.horizontal)
                            .onTapGesture {
                                configuration.context.delete(attachment: configuration.attachments[index].primaryURL)
                            }
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                }
            }
            
            if configuration.controlState != .readOnly {
                if let maxCount = configuration.maxCount {
                    if maxCount > configuration.attachments.count {
                        configuration.operations
                            .accessibilityIdentifier("Attachment:AddButton-\(UUID().uuidString)")
                            .environment(configuration.context)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                } else {
                    configuration.operations
                        .accessibilityIdentifier("Attachment:AddButton-\(UUID().uuidString)")
                        .environment(configuration.context)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .environment(
            {
                configuration.context.delegate = configuration.delegate
                configuration.context.configuration = configuration
                return configuration.context
            }()
        )
    }
}

extension MyAttachmentGroupStyle {
    func getFileInfo(fileUrl: URL) -> (String, Int?, Date?)? {
        guard let resourceValues = try? fileUrl.resourceValues(forKeys: [.fileSizeKey, .creationDateKey, .contentModificationDateKey, .nameKey]) else { return nil }
        return (fileUrl.lastPathComponent, resourceValues.fileSize, resourceValues.contentModificationDate)
    }
    
    func format(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    func format(size: Int) -> String {
        ByteCountFormatter.string(fromByteCount: Int64(size), countStyle: .file)
    }
}

private extension AttachmentGroupConfiguration {
    func getAttachmentInfo(_ configuration: AttachmentGroupConfiguration, at index: Int) -> Binding<AttachmentInfo> {
        configuration.$attachments[index]
    }
}

// demo data struct for supporting different UI elements
struct MyExtraInfo: Hashable {
    var boolValue: Bool?
    var intValue: Int?
}

extension MyExtraInfo {
    static func random() -> Self {
        switch Bool.random() {
        case true:
            return .init(boolValue: Bool.random())
        case false:
            return .init(intValue: Int.random(in: 0 ..< 100))
        }
    }
    
    static func create(extraInfo: Any) -> Self {
        if extraInfo is Bool {
            return MyExtraInfo(boolValue: extraInfo as? Bool)
        }
        if extraInfo is Int {
            return MyExtraInfo(intValue: extraInfo as? Int ?? 0)
        }
        fatalError("Unhandled extraInfo type")
    }
}

class MyAttachmentDelegateForInProgressAndErrorDemo: BasicAttachmentDelegate {
    public init() {
        super.init()
    }
    
    override func upload(contentFrom provider: NSItemProvider, onStarting: ((URL) -> Void)? = nil, onCompletion: @escaping (URL?, Error?) -> Void) {
        if let identifier = provider.registeredTypeIdentifiers.first {
            provider.loadFileRepresentation(forTypeIdentifier: identifier) { url, _ in
                if let url {
                    if let onStarting {
                        DispatchQueue.main.async {
                            onStarting(url)
                        }
                    }
                    Thread.sleep(forTimeInterval: [2.0, 3.0, 5.0, 7.0, 10.0].randomElement() ?? 3.0)
                    if Bool.random() {
                        onCompletion(nil, AttachmentError.failedToUploadAttachment("Simulated error for demo purpose. Please remove this line of code to enable local saving."))
                    } else {
                        self.saveLocally(url: url, identifier: identifier, onCompletion: onCompletion)
                    }
                } else {
                    onCompletion(nil, AttachmentError.failedToUploadAttachment("Failed to load file representation."))
                }
            }
        } else {
            onCompletion(nil, AttachmentError.failedToUploadAttachment("Failed to get type identifier of the provider."))
        }
    }
}

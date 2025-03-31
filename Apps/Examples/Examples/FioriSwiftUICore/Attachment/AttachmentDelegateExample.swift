🌱 Cloning SwiftFormat 0.53.4
🌱 Resolving package
🌱 Building product swiftformat
🌱 Installed SwiftFormat 0.53.4
🌱 Running swiftformat 0.53.4...
import FioriSwiftUICore
import SwiftUI

struct AttachmentDelegateExample: View {
    @State var groupOneAttachments: [URL]
    @State var groupTwoAttachments: [URL]
    @State var groupThreeAttachments: [URL]
    
    @State var groupOneError: AttributedString?
    @State var groupTwoError: AttributedString?
    @State var groupThreeError: AttributedString?

    let groupOneProeceeor: BasicAttachmentDelegate
    let groupTwoProeceeor: BasicAttachmentDelegate
    let groupThreeProeceeor: MyAttachmentDelegate

    init() {
        var g1Attachments: [URL] = []
        self.groupOneProeceeor = BasicAttachmentDelegate(localFolderName: "groupOneAttachments") { folder in
            g1Attachments = BasicAttachmentDelegate.copy(
                attachments: [
                    Bundle.main.url(forResource: "PDF advances in foundation - Landscape", withExtension: "pdf"),
                    Bundle.main.url(forResource: "HTML File Example", withExtension: "html"),
                    Bundle.main.url(forResource: "MD File Example", withExtension: "md")
                ].compactMap { $0 },
                to: folder
            )
        }
        self.groupOneAttachments = g1Attachments
        self.groupOneError = nil

        var g2Attachments: [URL] = []
        self.groupTwoProeceeor = BasicAttachmentDelegate(localFolderName: "groupTwoAttachments") { folder in
            g2Attachments = BasicAttachmentDelegate.copy(
                attachments: [
                    Bundle.main.url(forResource: "Word File Example", withExtension: "docx"),
                    Bundle.main.url(forResource: "Excel File Example", withExtension: "xlsx")
                ].compactMap { $0 },
                to: folder
            )
        }
            
        self.groupTwoAttachments = g2Attachments
        self.groupTwoError = nil

        self.groupThreeAttachments = []
        self.groupThreeProeceeor = MyAttachmentDelegate()
        self.groupThreeError = nil
    }

    var body: some View {
        ScrollView {
            VStack {
                AttachmentGroup(
                    title: { Text("Finished/Readonly Attachments (\(self.groupOneAttachments.count))") },
                    attachments: self.$groupOneAttachments,
                    delegate: self.groupOneProeceeor,
                    controlState: .readOnly,
                    errorMessage: self.$groupOneError
                )
                
                AttachmentGroup(
                    title: { Text("WiP Attachments \(self.groupTwoAttachments.count) of 5") },
                    attachments: self.$groupTwoAttachments,
                    maxCount: 5,
                    delegate: self.groupTwoProeceeor,
                    errorMessage: self.$groupTwoError,
                    operations: {
                        AttachmentButtonImage()
                            .operationsMenu {
                                PhotosPickerMenuItem(filter: [.images])
                                FilesPickerMenuItem(filter: [.pdf, .presentation])
                            }
                    }
                )
                
                AttachmentGroup(
                    title: { Text("Attachments w/ Custom Delegate") },
                    attachments: self.$groupThreeAttachments,
                    maxCount: 5,
                    delegate: self.groupThreeProeceeor,
                    errorMessage: self.$groupThreeError,
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

extension BasicAttachmentDelegate {
    static func copy(attachments: [URL], to folder: URL) -> [URL] {
        do {
            let mgr = FileManager.default
            if mgr.fileExists(atPath: folder.path) {
                if try mgr.contentsOfDirectory(atPath: folder.path).count > 0 {
                    try mgr.removeItem(at: folder)
                    try mgr.createDirectory(at: folder, withIntermediateDirectories: true, attributes: nil)
                }
            } else {
                try mgr.createDirectory(at: folder, withIntermediateDirectories: true, attributes: nil)
            }
            
            try attachments.forEach {
                let attachmentURL = folder.appendingPathComponent($0.lastPathComponent)
                try FileManager.default.copyItem(at: $0, to: attachmentURL)
            }
            return try FileManager.default.contentsOfDirectory(at: folder, includingPropertiesForKeys: nil)
        } catch {
            print("Error preparing attachments folder: \(error)")
            return []
        }
    }
}

public class MyAttachmentDelegate: BasicAttachmentDelegate {
    public init() {
        super.init(localFolderName: "groupThreeAttachments") { folder in
            // you can play with commenting following code, which performs cleanup. Then, the second upload of the same file will cause an error.
            let _ = BasicAttachmentDelegate.copy(attachments: [], to: folder)
        }
    }
    
    override public func getAttachmentNameAndExt(from url: URL, utTypeidentifier identifier: String) throws -> URL {
        let fileURL = try super.getAttachmentNameAndExt(from: url, utTypeidentifier: identifier)
        let ext = fileURL.pathExtension
        let name = fileURL.deletingPathExtension().lastPathComponent
        let folder = fileURL.deletingLastPathComponent()
        return folder.appendingPathComponent(name + "_processed").appendingPathExtension(ext)
    }
}

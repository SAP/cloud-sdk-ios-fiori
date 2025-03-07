import FioriSwiftUICore
import SwiftUI

struct AttachmentProcessorExample: View {
    @State var groupOneAttachments: [URL]
    @State var groupTwoAttachments: [URL]
    @State var groupThreeAttachments: [URL]

    let groupOneProeceeor: BaseAttachmentProcessor
    let groupTwoProeceeor: BaseAttachmentProcessor
    let groupThreeProeceeor: MyAttachmentProcessor

    init() {
        var g1Attachments: [URL] = []
        self.groupOneProeceeor = BaseAttachmentProcessor(localFolderName: "groupOneAttachments") { folder in
            g1Attachments = BaseAttachmentProcessor.copy(
                attachments: [
                    Bundle.main.url(forResource: "PDF advances in foundation - Landscape", withExtension: "pdf"),
                    Bundle.main.url(forResource: "HTML File Example", withExtension: "html"),
                    Bundle.main.url(forResource: "MD File Example", withExtension: "md")
                ].compactMap { $0 },
                to: folder
            )
        }
        self.groupOneAttachments = g1Attachments
        
        var g2Attachments: [URL] = []
        self.groupTwoProeceeor = BaseAttachmentProcessor(localFolderName: "groupTwoAttachments") { folder in
            g2Attachments = BaseAttachmentProcessor.copy(
                attachments: [
                    Bundle.main.url(forResource: "Word File Example", withExtension: "docx"),
                    Bundle.main.url(forResource: "Excel File Example", withExtension: "xlsx")
                ].compactMap { $0 },
                to: folder
            )
        }
            
        self.groupTwoAttachments = g2Attachments
        
        self.groupThreeAttachments = []
        self.groupThreeProeceeor = MyAttachmentProcessor()
    }

    var body: some View {
        ScrollView {
            VStack {
                AttachmentGroup(
                    title: { Text("Finished/Readonly Attachments \(self.groupOneAttachments.count)") },
                    attachments: self.$groupOneAttachments,
                    processor: self.groupOneProeceeor,
                    controlState: .readOnly
                )
                
                AttachmentGroup(
                    title: { Text("WiP Attachments \(self.groupTwoAttachments.count) of 5") },
                    attachments: self.$groupTwoAttachments,
                    maxCount: 5,
                    processor: self.groupTwoProeceeor,
                    operations: {
                        AttachmentButtonImage()
                            .operationsMenu {
                                AttachmentMenuItems.photos(filter: [.images])
                                AttachmentMenuItems.files(filter: [.pdf, .presentation])
                            }
                    }
                )
                
                AttachmentGroup(
                    title: { Text("Attachments w/ Custom Processor") },
                    attachments: self.$groupThreeAttachments,
                    maxCount: 5,
                    processor: self.groupThreeProeceeor,
                    operations: {
                        AttachmentButtonImage()
                            .operationsMenu {
                                AttachmentMenuItems.photos(filter: [.images])
                                AttachmentMenuItems.files(filter: [.pdf, .presentation])
                            }
                    }
                )
            }
        }
    }
}

extension BaseAttachmentProcessor {
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

public class MyAttachmentProcessor: BaseAttachmentProcessor {
    public init() {
        super.init(localFolderName: "groupThreeAttachments")
    }
    
    override public func getAttachmentNameAndExt(from url: URL, utTypeidentifier identifier: String) throws -> URL {
        let fileURL = try super.getAttachmentNameAndExt(from: url, utTypeidentifier: identifier)
        let ext = fileURL.pathExtension
        let name = fileURL.deletingPathExtension().lastPathComponent
        let folder = fileURL.deletingLastPathComponent()
        return folder.appendingPathComponent(name + "_processed").appendingPathExtension(ext)
    }
}

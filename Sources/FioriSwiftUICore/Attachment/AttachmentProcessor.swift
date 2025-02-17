import Foundation
import UniformTypeIdentifiers

// to add delete
public class AttachmentProcessor {
    public init() {}
    
    // app specific
    public func getNameWithExt(url: URL, utTypeidentifier identifier: String?) -> String {
        var fileName = url.lastPathComponent
        let ext = url.pathExtension
        if ext.isEmpty {
            guard let identifier else { return fileName }
            fileName += UTType(identifier)?.preferredFilenameExtension ?? ""
        }
        return fileName
    }
    
    // app specific
    public func process(provider: NSItemProvider, onAttachment: @escaping (URL) -> Void) {
        let identifier = provider.registeredTypeIdentifiers[0] // go with first?
        provider.loadFileRepresentation(forTypeIdentifier: identifier) {
            url, _ in
            
            let copy = FileManager.default.temporaryDirectory.appendingPathComponent(self.getNameWithExt(url: url!, utTypeidentifier: identifier))
            try? FileManager.default.copyItem(at: url!, to: copy)
            
            onAttachment(copy)
            
            print("file exits?: \(FileManager.default.fileExists(atPath: copy.relativePath))")
            print(copy.path())
        }
    }
}

public class MyAttachmentProcessor: AttachmentProcessor {
    override public func getNameWithExt(url: URL, utTypeidentifier identifier: String?) -> String {
        super.getNameWithExt(url: url, utTypeidentifier: identifier)
    }
    
    override public func process(provider: NSItemProvider, onAttachment: @escaping (URL) -> Void) {
        let identifier = provider.registeredTypeIdentifiers[0] // go with first?
        provider.loadFileRepresentation(forTypeIdentifier: identifier) {
            url, _ in
            
            let copy = FileManager.default.temporaryDirectory.appendingPathComponent(self.getNameWithExt(url: url!, utTypeidentifier: identifier))
            try? FileManager.default.copyItem(at: url!, to: copy)
            
            onAttachment(copy)
            
            print("file exits?: \(FileManager.default.fileExists(atPath: copy.relativePath))")
            print(copy.path())
        }
    }
}

import Foundation
import UniformTypeIdentifiers

enum AttachmentError: Error {
    case failedToDeleteAttachment(String)
    case failedToUploadAttachment(String)
}

public class BaseAttachmentProcessor: AttachmentProcessor {
    public init() {}
    
    public func delete(url: URL, onCompletion: @escaping (URL, (any Error)?) -> Void) throws {
        do {
            onCompletion(url, nil)
        } catch {
            if type(of: error) == AttachmentError.self {
                onCompletion(url, error)
            } else {
                onCompletion(url, AttachmentError.failedToUploadAttachment(error.localizedDescription))
            }
        }
    }
    
    // app specific
    public func upload(contentFrom provider: NSItemProvider, onCompletion: @escaping (URL?, Error?) -> Void) {
        if let identifier = provider.registeredTypeIdentifiers.first {
            provider.loadFileRepresentation(forTypeIdentifier: identifier) { url, _ in
                if let url {
                    self.saveLocally(url: url, identifier: identifier, onCompletion: onCompletion)
                } else {
                    onCompletion(nil, AttachmentError.failedToUploadAttachment("Failed to load file representation."))
                }
            }
        } else {
            onCompletion(nil, AttachmentError.failedToUploadAttachment("Failed to get type identifier of the provider."))
        }
    }
    
    public func saveLocally(url: URL, identifier: String, onCompletion: @escaping (URL?, Error?) -> Void) {
        do {
            let attachmentName = self.getAttachmentNameAndExt(from: url, utTypeidentifier: identifier)
            let copy = try self.getLocalFolderURL().appendingPathComponent(attachmentName)
            try FileManager.default.copyItem(at: url, to: copy)
            print("file exits?: \(FileManager.default.fileExists(atPath: copy.relativePath))")
            print(copy.path())
            onCompletion(copy, nil)
        } catch {
            if type(of: error) == AttachmentError.self {
                onCompletion(nil, error)
            } else {
                onCompletion(nil, AttachmentError.failedToUploadAttachment(error.localizedDescription))
            }
        }
    }
    
    // app specific
    public func getAttachmentNameAndExt(from url: URL, utTypeidentifier identifier: String) -> String {
        var fileName = url.lastPathComponent
        let ext = url.pathExtension
        if ext.isEmpty {
            fileName += UTType(identifier)?.preferredFilenameExtension ?? ""
        }
        return fileName
    }
    
    // app specific
    public func getLocalFolderURL() throws -> URL {
        FileManager.default.temporaryDirectory
    }
}

public class MyAttachmentProcessor: BaseAttachmentProcessor {
    // app specific
    override public func getAttachmentNameAndExt(from url: URL, utTypeidentifier identifier: String) -> String {
        var fileName = url.lastPathComponent + "_uploaded"
        let ext = url.pathExtension
        if ext.isEmpty {
            fileName += UTType(identifier)?.preferredFilenameExtension ?? ""
        }
        return fileName
    }
}

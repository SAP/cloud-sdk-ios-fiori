import Foundation
import UniformTypeIdentifiers

public class BaseAttachmentProcessor: AttachmentProcessor {
    public static let demoFolderName = "AttachmentDemoFolder"
//    public static func demoFolderURL() -> URL {
//        let mgr = FileManager.default
//        let folder = mgr.temporaryDirectory.appendingPathComponent(demoFolderName, isDirectory: true)
//        if mgr.fileExists(atPath: folder.path) {
//            try! mgr.createDirectory(atPath: folder.path, withIntermediateDirectories: true, attributes: nil)
//        }
//        return folder
//    }
    
    public let localFolder: URL
    
    public init(localFolderName: String = BaseAttachmentProcessor.demoFolderName, onPrepared: ((URL) -> Void)? = nil) {
        let mgr = FileManager.default
        let folder = mgr.temporaryDirectory.appendingPathComponent(localFolderName, isDirectory: true)
        print("BaseAttachmentProcessor.init local folder: \(folder.path)")
        if !mgr.fileExists(atPath: folder.path) {
            print("BaseAttachmentProcessor.init create local folder: \(folder.path)")
            try! mgr.createDirectory(atPath: folder.path, withIntermediateDirectories: true, attributes: nil)
        }
        self.localFolder = folder
        onPrepared?(folder)
    }
    
    public func delete(url: URL, onCompletion: @escaping (URL, (any Error)?) -> Void) {
        do {
            if url.path().hasPrefix(self.localFolder.path()) {
                try FileManager.default.removeItem(at: url)
            }
            onCompletion(url, nil)
        } catch {
            if error is AttachmentError {
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
            let copy = try self.getAttachmentNameAndExt(from: url, utTypeidentifier: identifier)
            try FileManager.default.copyItem(at: url, to: copy)
            print("file exits?: \(FileManager.default.fileExists(atPath: copy.relativePath))")
            print(copy.path())
            onCompletion(copy, nil)
        } catch {
            if error is AttachmentError {
                onCompletion(nil, error)
            } else {
                onCompletion(nil, AttachmentError.failedToUploadAttachment(error.localizedDescription))
            }
        }
    }
    
    // app specific
    public func getAttachmentNameAndExt(from url: URL, utTypeidentifier identifier: String) throws -> URL {
        var ext = url.pathExtension
        let name = url.deletingPathExtension().lastPathComponent
        if ext.isEmpty {
            ext = self.getOrInferExt(extension: url.pathExtension, utTypeidentifier: identifier)
        }
        let copy = self.localFolder.appendingPathComponent(name).appendingPathExtension(ext)
        if FileManager.default.fileExists(atPath: copy.relativePath) {
            if ext.isEmpty {
                return self.localFolder.appendingPathComponent(name + " \(UUID().uuidString)")
            } else {
                return self.localFolder.appendingPathComponent(name + " \(UUID().uuidString)").appendingPathExtension(ext)
            }
        } else {
            return copy
        }
    }
    
    // app specific
    public func getOrInferExt(extension ext: String, utTypeidentifier identifier: String) -> String {
        ext.isEmpty ? (UTType(identifier)?.preferredFilenameExtension ?? "") : ext
    }
    
//    // app specific
//    public func getLocalFolderURL() throws -> URL {
//        let tempDir = FileManager.default.temporaryDirectory
//        let localDir = tempDir.appendingPathComponent(localFolderName)
//        if !FileManager.default.fileExists(atPath: localDir.path) {
//            try FileManager.default.createDirectory(at: localDir, withIntermediateDirectories: true, attributes: nil)
//        }
//        return localDir
//    }
}

public class MyAttachmentProcessor: BaseAttachmentProcessor {
    // app specific
    override public func getAttachmentNameAndExt(from url: URL, utTypeidentifier identifier: String) throws -> URL {
        let fileURL = try super.getAttachmentNameAndExt(from: url, utTypeidentifier: identifier)
        let ext = fileURL.pathExtension
        let name = fileURL.deletingPathExtension().lastPathComponent
        let folder = fileURL.deletingLastPathComponent()
        return folder.appendingPathComponent(name + "_processed.").appendingPathExtension(ext)
    }
}

import Foundation
import UniformTypeIdentifiers

/// Basic implementation for demostrating AttachmentDelegate protocol. This is a local folder based implementation.
open class BasicAttachmentDelegate: AttachmentDelegate {
    /// Default folder
    public static let demoFolderName = "AttachmentDemoFolder"

    /// Convince property for Apps to get local folder
    public let localFolder: URL
    
    public init(localFolderName: String? = nil, onPrepare: ((URL) -> Void)? = nil) {
        let folderName = localFolderName ?? BasicAttachmentDelegate.demoFolderName
        let mgr = FileManager.default
        let folder = mgr.temporaryDirectory.appendingPathComponent(folderName, isDirectory: true)
        if !mgr.fileExists(atPath: folder.path) {
            try! mgr.createDirectory(atPath: folder.path, withIntermediateDirectories: true, attributes: nil)
        }
        self.localFolder = folder
        onPrepare?(folder)
    }
    
    /// delete
    open func delete(url: URL, onCompletion: @escaping (URL, (any Error)?) -> Void) {
        do {
            try FileManager.default.removeItem(at: url)
            onCompletion(url, nil)
        } catch {
            if error is AttachmentError {
                onCompletion(url, error)
            } else {
                onCompletion(url, AttachmentError.failedToUploadAttachment(error.localizedDescription))
            }
        }
    }
    
    /// upload
    open func upload(contentFrom provider: NSItemProvider, onCompletion: @escaping (URL?, Error?) -> Void) {
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
    
    /// save to local folder
    open func saveLocally(url: URL, identifier: String, onCompletion: @escaping (URL?, Error?) -> Void) {
        do {
            let copy = try self.getAttachmentNameAndExt(from: url, utTypeidentifier: identifier)
            try FileManager.default.copyItem(at: url, to: copy)
            onCompletion(copy, nil)
        } catch {
            if error is AttachmentError {
                onCompletion(nil, error)
            } else {
                onCompletion(nil, AttachmentError.failedToUploadAttachment(error.localizedDescription))
            }
        }
    }
    
    /// get targert file name
    open func getAttachmentNameAndExt(from url: URL, utTypeidentifier identifier: String) throws -> URL {
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
    
    /// infer attachment name
    open func getOrInferExt(extension ext: String, utTypeidentifier identifier: String) -> String {
        ext.isEmpty ? (UTType(identifier)?.preferredFilenameExtension ?? "") : ext
    }
}

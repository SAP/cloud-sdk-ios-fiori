import CoreLocation
import Foundation

/// Delegate protocol defines how to upload and remove attachments.
public protocol AttachmentDelegate: AnyObject {
    /// delete attachment
    func delete(url: URL, onCompletion: @escaping (URL, Error?) -> Void)
    
    /// upload attachment
    @available(*, deprecated, message: "Use upload(contentFrom:location:onStarting:onCompletion:) instead")
    func upload(contentFrom provider: NSItemProvider, onStarting: ((URL) -> Void)?, onCompletion: @escaping (URL?, Error?) -> Void)

    /// upload attachment with optional location metadata
    func upload(contentFrom provider: NSItemProvider, location: CLLocation?, onStarting: ((URL) -> Void)?, onCompletion: @escaping (URL?, Error?) -> Void)
}

public extension AttachmentDelegate {
    /// Default implementation that forwards to the deprecated method for backward compatibility.
    func upload(contentFrom provider: NSItemProvider, location: CLLocation?, onStarting: ((URL) -> Void)?, onCompletion: @escaping (URL?, Error?) -> Void) {
        self.upload(contentFrom: provider, onStarting: onStarting, onCompletion: onCompletion)
    }
}

/// Errors occurs during attachment upload or deletion
public enum AttachmentError: Error {
    /// deletion error
    case failedToDeleteAttachment(String)
    
    /// upload error
    case failedToUploadAttachment(String)
}

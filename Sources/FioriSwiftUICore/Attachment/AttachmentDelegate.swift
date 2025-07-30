import Foundation

/// Delegate protocl defines how to upload and remove attachments.
public protocol AttachmentDelegate: AnyObject {
    /// delete attachment
    func delete(url: URL, onCompletion: @escaping (URL, Error?) -> Void)
    
    /// upload attachment
    func upload(contentFrom provider: NSItemProvider, onCompletion: @escaping (URL?, Error?) -> Void)
}

/// Errors occurs during attachment upload or deletion
public enum AttachmentError: Error {
    /// deletion error
    case failedToDeleteAttachment(String)
    
    /// upload error
    case failedToUploadAttachment(String)
}

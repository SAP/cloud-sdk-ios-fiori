import Foundation

/// Delegate protocol defines how to upload and remove attachments.
public protocol AttachmentDelegate: AnyObject {
    /// delete attachment
    func delete(url: URL, onCompletion: @escaping @Sendable (URL, Error?) -> Void)

    /// upload attachment
    func upload(contentFrom provider: NSItemProvider, onStarting: (@MainActor @Sendable (URL) -> Void)?, onCompletion: @escaping @Sendable (URL?, Error?) -> Void)
}

/// Errors occurs during attachment upload or deletion
public enum AttachmentError: Error {
    /// deletion error
    case failedToDeleteAttachment(String)

    /// upload error
    case failedToUploadAttachment(String)
}

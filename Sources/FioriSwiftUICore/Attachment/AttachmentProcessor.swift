import Foundation

public protocol AttachmentProcessor {
    func delete(url: URL, onCompletion: @escaping (URL, Error?) -> Void) -> Void
    func upload(contentFrom provider: NSItemProvider, onCompletion: @escaping (URL?, Error?) -> Void)
}

public enum AttachmentError: Error {
    case failedToDeleteAttachment(String)
    case failedToUploadAttachment(String)
}

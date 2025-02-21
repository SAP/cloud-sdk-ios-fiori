import Foundation

public protocol AttachmentProcessor {
    func delete(url: URL, onCompletion: @escaping (URL, Error?) -> Void) throws -> Void
    func upload(contentFrom provider: NSItemProvider, onCompletion: @escaping (URL?, Error?) -> Void)
}

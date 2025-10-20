import SwiftUI

/// Represents the state of an attachment in the attachment flow.
///
/// `AttachmentInfo` tracks the lifecycle of an attachment through three states:
/// - `.uploading`: The attachment is in the process of being uploaded
/// - `.uploaded`: The attachment has been successfully uploaded
/// - `.error`: An error occurred during the attachment process
public enum AttachmentInfo: Identifiable, Hashable {
    /// The unique identifier for the attachment.
    ///
    /// This property returns the appropriate URL based on the current state:
    /// - For `.uploading` and `.error` states: Returns the source URL
    /// - For `.uploaded` state: Returns the destination URL
    public var id: URL {
        switch self {
        case .uploading(let sourceURL):
            return sourceURL
        case .uploaded(let destinationURL, _, _):
            return destinationURL
        case .error(let sourceURL, _):
            return sourceURL
        }
    }
    
    /// Represents an attachment that is currently being uploaded.
    ///
    /// - Parameter sourceURL: The local URL of the attachment being uploaded
    case uploading(sourceURL: URL)
    
    /// Represents an attachment that has been successfully uploaded.
    ///
    /// - Parameters:
    ///   - destinationURL: The remote URL where the attachment was uploaded
    ///   - sourceURL: The original local URL of the attachment
    ///   - extraInfo: Optional additional information about the attachment
    case uploaded(destinationURL: URL, sourceURL: URL, extraInfo: (any AttachmentExtraInfo)? = nil)
    
    /// Represents an attachment that encountered an error during the upload process.
    ///
    /// - Parameters:
    ///   - sourceURL: The local URL of the attachment that failed to upload
    ///   - message: A description of the error that occurred
    case error(sourceURL: URL, message: String)
    
    /// Determines if two `AttachmentInfo` instances are equal.
    ///
    /// - Parameters:
    ///   - lhs: The left-hand side attachment info to compare
    ///   - rhs: The right-hand side attachment info to compare
    /// - Returns: `true` if the attachment infos are equal, `false` otherwise
    public static func == (lhs: AttachmentInfo, rhs: AttachmentInfo) -> Bool {
        switch (lhs, rhs) {
        case (.uploading(let lURL), .uploading(let rURL)):
            return lURL == rURL
        case (.uploaded(let lURL, let lsURL, let lInfo), .uploaded(let rURL, let rsURL, let rInfo)):
            guard lURL == rURL else { return false }
            guard lsURL == rsURL else { return false }
            switch (lInfo, rInfo) {
            case (nil, nil):
                return true
            case (let l?, let r?):
                return AnyHashable(l) == AnyHashable(r)
            default:
                return false
            }
        case (.error(let lURL, let lMsg), .error(let rURL, let rMsg)):
            return lURL == rURL && lMsg == rMsg
        default:
            return false
        }
    }
    
    /// Hashes the essential components of this value by feeding them into the given hasher.
    ///
    /// - Parameter hasher: The hasher to use when combining the components of this instance
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .uploading(let sourceURL):
            hasher.combine(0)
            hasher.combine(sourceURL)
        case .uploaded(let destinationURL, let sourceURL, let extraInfo):
            hasher.combine(1)
            hasher.combine(destinationURL)
            hasher.combine(sourceURL)
            if let info = extraInfo {
                info.hash(into: &hasher)
            } else {
                hasher.combine(0)
            }
        case .error(let sourceURL, let message):
            hasher.combine(2)
            hasher.combine(sourceURL)
            hasher.combine(message)
        }
    }
}

public extension AttachmentInfo {
    /// Returns the primary URL associated with this attachment.
    ///
    /// Depending on the state:
    /// - For `.uploaded`: Returns the destination URL
    /// - For `.uploading` and `.error`: Returns the source URL
    var primaryURL: URL {
        switch self {
        case .uploaded(let url, _, _):
            return url
        case .uploading(let url):
            return url
        case .error(let url, _):
            return url
        }
    }
    
    /// Returns the file name of the attachment.
    ///
    /// This value is extracted from the last path component of the primary URL.
    var attachmentName: String {
        self.primaryURL.lastPathComponent
    }
    
    /// Returns the error message if the attachment is in an error state.
    ///
    /// - Returns: The error message if in `.error` state, `nil` otherwise
    var errorMessage: String? {
        if case .error(_, let message) = self {
            return message
        } else {
            return nil
        }
    }
}

public extension [AttachmentInfo] {
    /// Indicates whether any attachment in the array is currently uploading.
    ///
    /// - Returns: `true` if at least one attachment is in `.uploading` state, `false` otherwise
    var isUploading: Bool {
        self.contains { info in
            if case .uploading = info {
                return true
            } else {
                return false
            }
        }
    }
    
    /// Indicates whether any attachment in the array has an error.
    ///
    /// - Returns: `true` if at least one attachment is in `.error` state, `false` otherwise
    var hasError: Bool {
        self.contains { info in
            if case .error = info {
                return true
            } else {
                return false
            }
        }
    }
    
    /// Determines if the number of successfully uploaded attachments exceeds a specified count.
    ///
    /// - Parameter count: The threshold count to compare against
    /// - Returns: `true` if the number of uploaded attachments is greater than the specified count
    func hasAttachmentsMoreThan(_ count: Int) -> Bool {
        self.filter { info in
            if case .uploaded = info {
                return true
            } else {
                return false
            }
        }.count > count
    }
    
    /// Finds the index of the first uploaded attachment with the specified destination URL.
    ///
    /// - Parameter destinationURL: The destination URL to search for
    /// - Returns: The index of the first matching attachment, or `nil` if not found
    func firstIndexOfUploaded(destinationURL: URL) -> Int? {
        self.firstIndex { info in
            if case .uploaded(let url, _, _) = info, url == destinationURL {
                return true
            } else {
                return false
            }
        }
    }
}

/// A protocol that defines additional information that can be associated with an attachment.
///
/// Types conforming to this protocol must be `Hashable` to ensure they work properly with the
/// `AttachmentInfo` enum's `Hashable` conformance.
public typealias AttachmentExtraInfo = Hashable

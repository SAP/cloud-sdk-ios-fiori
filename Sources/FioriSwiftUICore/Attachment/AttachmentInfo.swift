import SwiftUI

public enum AttachmentInfo: Identifiable, Hashable {
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
    
    case uploading(sourceURL: URL)
    case uploaded(destinationURL: URL, sourceURL: URL, extraInfo: (any AttachmentExtraInfo)? = nil)
    case error(sourceURL: URL, message: String)
    
    public static func == (lhs: AttachmentInfo, rhs: AttachmentInfo) -> Bool {
        switch (lhs, rhs) {
        case (.uploading(let lURL), .uploading(let rURL)):
            return lURL == rURL
        case (.uploaded(let lURL, let lsURL, let lInfo), .uploaded(let rURL, let rsURL, let rInfo)):
            guard lURL == rURL else { return false }
            guard lsURL == rsURL else { return false }
            switch (lInfo, rInfo) {
            case (nil, nil): return true
            case (let l?, let r?):
                return AnyHashable(l) == AnyHashable(r)
            default: return false
            }
        case (.error(let lURL, let lMsg), .error(let rURL, let rMsg)):
            return lURL == rURL && lMsg == rMsg
        default:
            return false
        }
    }
    
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
    
    var attachmentName: String {
        self.primaryURL.lastPathComponent
    }
    
    var errorMessage: String? {
        if case .error(_, let message) = self {
            return message
        } else {
            return nil
        }
    }
}

public extension [AttachmentInfo] {
    var isUploading: Bool {
        self.contains { info in
            if case .uploading = info {
                return true
            } else {
                return false
            }
        }
    }
    
    var hasError: Bool {
        self.contains { info in
            if case .error = info {
                return true
            } else {
                return false
            }
        }
    }
    
    func hasAttachmentsMoreThan(_ count: Int) -> Bool {
        self.filter { info in
            if case .uploaded = info {
                return true
            } else {
                return false
            }
        }.count > count
    }
    
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

public typealias AttachmentExtraInfo = Hashable

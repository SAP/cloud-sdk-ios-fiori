import Foundation

/// :nodoc:
public typealias NSSStyleData = [String: Any]

/// :nodoc:
public extension NSSStyleData {
    func value(_ key: String) -> Self {
        self[key] as? Self ?? [:]
    }
}

class NSSManager {
    static let shared = NSSManager()
    
    private var styleCache: [String: NSSStyleData] = [:]
    
    func loadNSSFile(_ fileName: String) throws -> NSSStyleData {
        if let cachedStyle = styleCache[fileName] {
            return cachedStyle
        }
        
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "nss") else {
            throw NSSError.fileNotFound(fileName)
        }
        
        let content: String
        do {
            content = try String(contentsOf: fileURL, encoding: .utf8)
        } catch {
            throw NSSError.fileReadError(error)
        }
        
        let styles = try NSSParser.parseNssContent(content)
        self.styleCache[fileName] = styles
        return styles
    }
}

/// :nodoc:
public class NSSTool {
    /// Read style data from the .nss file.
    public static func loadStyles(_ fileName: String) -> NSSStyleData {
        do {
            let styles = try NSSManager.shared.loadNSSFile(fileName)
            return styles
        } catch {
            print("Failed to load NSS file: \(error)")
            return [:]
        }
    }
}

enum NSSError: Error {
    case fileNotFound(String)
    case fileReadError(Error)
    case parseError(String)
    case invalidSyntax(String)
    case invaliValue(String)
}

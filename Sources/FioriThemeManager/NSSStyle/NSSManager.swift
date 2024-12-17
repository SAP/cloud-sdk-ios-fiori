import Foundation

/// :nodoc:
public typealias NSSStyleData = [String: Any]

/// Extension of NSSStyleData
public extension NSSStyleData {
    /// Convert value to NSSStyleData.
    func value(_ key: String) -> Self {
        self[key] as? Self ?? [:]
    }
}

class NSSManager {
    static let shared = NSSManager()
    
    private var styleCache: [String: NSSStyleData] = [:]
    
    /// Global NSS style for managing settings.
    public var globalNSSStyle: NSSStyleData = [:]
    
    /// Merge NSS styles.
    public var mergeNSSStyle: NSSStyleData = [:]
    
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
    
    func registerNSSStyleSheet(_ fileName: String) {
        do {
            let style = try self.loadNSSFile(fileName)
            self.globalNSSStyle = self.globalNSSStyle.merging(style) { $1 }
            self.mergeNSSStyle = self.mergeNSSStyle.merging(style) { $1 }
        } catch {
            print("Failed to register NSS file: \(error)")
        }
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
    
    /// Use this call to apply a specific stylesheet for theming
    public static func registerNSSStyleSheet(_ fileName: String) {
        NSSManager.shared.registerNSSStyleSheet(fileName)
    }
    
    /// Get global nss style
    public static var globalNSSStyle: NSSStyleData {
        NSSManager.shared.globalNSSStyle
    }
    
    /// Get merge nss style
    public static var mergeNSSStyle: NSSStyleData {
        NSSManager.shared.mergeNSSStyle
    }
}

enum NSSError: Error {
    case fileNotFound(String)
    case fileReadError(Error)
    case parseError(String)
    case invalidSyntax(String)
    case invaliValue(String)
}

/// The way to parse data.
public enum NSSParserType {
    /// Parse data according to the nss file name.
    case file(String)
    /// Parse data according to NSSStyleData.
    case data(NSSStyleData)
    /// Parse data according to text.
    case content(String)
}

/// Protocol for parsing NSS data.
public protocol ParserNSSData {
    /// Provide a property of type NSSStyleData for types implementing this protocol.
    var nssData: NSSStyleData { get }
}

extension NSSParserType: ParserNSSData {
    /// Different parsing methods return merge nss style data.
    public var nssData: NSSStyleData {
        switch self {
        case .file(let fileName):
            let styles = NSSTool.loadStyles(fileName)
            NSSManager.shared.mergeNSSStyle = NSSManager.shared.mergeNSSStyle.merging(styles) { $1 }
            return NSSTool.mergeNSSStyle
        case .data(let data):
            NSSManager.shared.mergeNSSStyle = NSSManager.shared.mergeNSSStyle.merging(data) { $1 }
            return NSSTool.mergeNSSStyle
        case .content(let content):
            do {
                let style = try NSSParser.parseNssContent(content)
                NSSManager.shared.mergeNSSStyle = NSSManager.shared.mergeNSSStyle.merging(style) { $1 }
                return NSSTool.mergeNSSStyle
            } catch {
                print(NSSError.parseError("Parse failed"))
                return [:]
            }
        }
    }
}

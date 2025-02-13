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
            self.globalNSSStyle = NSSTool.mergeStyleDictionaries(self.globalNSSStyle, style)
            self.mergeNSSStyle = NSSTool.mergeStyleDictionaries(self.globalNSSStyle, style)
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
    
    // Merge two style dictionaries
    static func mergeStyleDictionaries(_ dict1: [String: Any], _ dict2: [String: Any]) -> [String: Any] {
        var result = dict1
            
        for (key, value) in dict2 {
            if let existingValue = result[key] as? [String: String],
               let newValue = value as? [String: String]
            {
                // If both values are of type [String: String], merge the internal dictionaries.
                result[key] = existingValue.merging(newValue) { $1 }
            } else {
                // Otherwise, directly replace the value.
                result[key] = value
            }
        }
            
        return result
    }
    
    /// Data types for `ControlState`. Equivalent to `UIControl.State`.
    public struct ControlState: OptionSet, Hashable {
        public let rawValue: UInt
        
        /// Initialization
        public init(rawValue: UInt) { self.rawValue = rawValue }
        
        /// Normal UI control state
        public static let normal = ControlState(rawValue: 1 << 0)
        /// Highlighted UI control state
        public static let highlighted = ControlState(rawValue: 1 << 1)
        /// Disabled UI control state
        public static let disabled = ControlState(rawValue: 1 << 2)
        /// Selected UI control state
        public static let selected = ControlState(rawValue: 1 << 3)
        /// Focused UI control state
        public static let focused = ControlState(rawValue: 1 << 4)
        /// Read-Only control state
        public static let readOnly = ControlState(rawValue: 1 << 5)
        
        /// Extends ``UIControl.State`` to be ``Hashable``
        public func hash(into hasher: inout Hasher) {
            hasher.combine(self.rawValue)
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

/// The way to parse data.
public enum NSSParserType {
    /// Parse data according to the nss file name.
    case file(String)
    /// Parse data according to NSSStyleData.
    case data(NSSStyleData)
    /// Parse data according to text.
    case content(String)
    
    /// Merge nss style data.
    public func mergeNSSData() {
        switch self {
        case .file(let fileName):
            let styles = NSSTool.loadStyles(fileName)
            NSSManager.shared.mergeNSSStyle = NSSTool.mergeStyleDictionaries(NSSManager.shared.mergeNSSStyle, styles)
        case .data(let data):
            NSSManager.shared.mergeNSSStyle = NSSTool.mergeStyleDictionaries(NSSManager.shared.mergeNSSStyle, data)
        case .content(let content):
            do {
                let style = try NSSParser.parseNssContent(content)
                NSSManager.shared.mergeNSSStyle = NSSTool.mergeStyleDictionaries(NSSManager.shared.mergeNSSStyle, style)
            } catch {
                print(NSSError.parseError("Parse failed"))
            }
        }
    }
}

/// Protocol for parsing NSS data.
public protocol ParserNSSData {
    /// Provide a property of type NSSStyleData for types implementing this protocol.
    var nssData: NSSStyleData { get }
}

extension NSSParserType: ParserNSSData {
    /// Different parsing methods return merge nss style data.
    public var nssData: NSSStyleData {
        self.mergeNSSData()
        return NSSTool.mergeNSSStyle
    }
}

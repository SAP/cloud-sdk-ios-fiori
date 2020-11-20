import Foundation

extension Array where Element == NSRange {
    func maxRange() -> Int {
        self.reduce(0) { prev, next in
            let maxNext = NSMaxRange(next)
            return Swift.max(prev, maxNext)
        }
    }
}

extension String {
    private static let mustacheRegex = try! NSRegularExpression(pattern: #"\{\{?(?<mustache>(#[a-zA-Z0-9\/])?[a-zA-Z0-9\/._]+.[a-zA-Z0-9\/])*\}?\}"#, options: [])
    private static let mustacheKeyname = "mustache"
    
    func mustachePlaceholders() -> [(String, NSRange)] {
        var shouldStop = false
        var placeholders: [(keyname: String, replacementRange: NSRange)] = []
        var counterIndex: Int = 0
        while !shouldStop {
            guard counterIndex < self.count else { shouldStop = true; break }
            if let match = String.mustacheRegex.firstMatch(in: self, options: [], range: NSRange(counterIndex ..< self.count)) {
                let range = match.range(withName: String.mustacheKeyname)
                if range.location != NSNotFound {
                    placeholders.append((keyname: NSString(string: self).substring(with: range), replacementRange: match.range))
                }
            } else { shouldStop = true; break }
            counterIndex = placeholders.map { $0.replacementRange }.maxRange() + 1
        }
        return placeholders
    }
    
    func replacingPlaceholders(withValuesIn object: Any) -> String {
        var mutableString = self
        // identify the keys and ranges of the mustache placeholders
        let substitutions = mutableString.mustachePlaceholders()
        // work from back-to-front, to avoid distrupting downstream ranges (avoids recomputing placeholders)
        for sub in substitutions.reversed() {
            // split on `/`, to support multi-level key paths
//            let keyPath = sub.0.split(separator: "/").map { String($0) }
            // feed keypath to utility, to read from [String: Any] structure, to get substitute value
            var separator: String.Element = sub.0.contains(".") ? "." : "/"
            if let value = `Any`.resolve(object, keyPath: sub.0, separator: separator) {
                mutableString = mutableString.replacingCharacters(in: Range(sub.1, in: mutableString)!, with: String(describing: value))
            }
        }
        return mutableString
    }
    
    func replacingPlaceholdersToDouble(withValuesIn object: Any) -> Double? {
        var mutableString = self
        // identify the keys and ranges of the mustache placeholders
        let substitutions = mutableString.mustachePlaceholders()
        // work from back-to-front, to avoid distrupting downstream ranges (avoids recomputing placeholders)
        for sub in substitutions.reversed() {
            // split on `/`, to support multi-level key paths
            //            let keyPath = sub.0.split(separator: "/").map { String($0) }
            // feed keypath to utility, to read from [String: Any] structure, to get substitute valuex
            
            if let value = `Any`.resolve(object, keyPath: sub.0, separator: "/") {
                return Double(String(describing: value)) // mutableString = mutableString.replacingCharacters(in: Range(sub.1, in: mutableString)!, with: String(describing: value))
            }
        }
        return nil // Double(mutableString)!
    }
    
    func replacingPlaceholdersToBoolean(withValuesIn object: Any) -> Bool? {
        var mutableString = self
        // identify the keys and ranges of the mustache placeholders
        let substitutions = mutableString.mustachePlaceholders()
        // work from back-to-front, to avoid distrupting downstream ranges (avoids recomputing placeholders)
        for sub in substitutions.reversed() {
            // split on `/`, to support multi-level key paths
            //            let keyPath = sub.0.split(separator: "/").map { String($0) }
            // feed keypath to utility, to read from [String: Any] structure, to get substitute value
            
            if let value = `Any`.resolve(object, keyPath: sub.0, separator: "/") {
                return Bool(String(describing: value))
            }
        }
        return nil
    }
}

// TODO: Open Source
// from here: https://github.com/onmyway133/Omnia, used under MIT license
public typealias JSONDictionary = [String: Any]
public typealias JSONArray = [JSONDictionary]

protocol Initializable {
    init<T>(_: T)
}

extension String: Initializable {
    init<T>(_ value: T) {
        self = String(describing: value)
    }
}

extension Double: Initializable {
    init<T>(_ value: T) {
        self = Double(String(describing: value))
    }
}

extension Int: Initializable {
    init<T>(_ value: T) {
        self = Int(String(describing: value))
    }
}

extension Bool: Initializable {
    init<T>(_ value: T) {
        self = Bool(String(describing: value))
    }
}

enum `Any` {
    static func resolve(_ object: Any, keyPath: String?, separator: String.Element = ".") -> Any? {
        var current: Any? = object

        if keyPath == "parameters.TODAY_ISO" {
            let today = Date()
            let df = DateFormatter()
            df.dateFormat = "MM/dd/yyyy"
            return df.string(from: today)
        } else if keyPath == "parameters.NOW_ISO" {
            let today = Date()
            let df = DateFormatter()
            df.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            return df.string(from: today)
        } else if keyPath == "parameters.LOCALE" {
            return Locale.current.languageCode
        }

        let keyPathComponents = keyPath?.split(separator: separator)
        keyPathComponents?.forEach { component in

            if let maybeInt = Int(component), let array = current as? [Any] {
                current = array[maybeInt]
            } else if let dictionary = current as? JSONDictionary {
                if separator == "." {
                    if let foundValue = dictionary[String(component)] {
                        if let configParameter = foundValue as? Configuration.Parameter {
                            let value = configParameter.value
                            if let stringValue = value as? String {
                                current = stringValue.replacingPlaceholders(withValuesIn: object)
                            } else {
                                current = configParameter.value
                            }
                        }
                    } else {
                        if keyPathComponents?.last == component {
                            current = nil
                        }
                    }
                } else {
                    current = dictionary[String(component)]
                }
            }
        }
        
        return current
    }
}

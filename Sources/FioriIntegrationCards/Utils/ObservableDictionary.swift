import AnyCodable
import Combine
import Foundation

public extension Dictionary where Key == String, Value == Any {
    func resolve<T>(keyPath: Key?, separator: String.Element = "/") -> T? {
        var current: Any? = self
        let keyPath = keyPath ?? Key(separator)
        
        keyPath.split(separator: separator).forEach { component in
            if let maybeInt = Int(component), let array = current as? [Any] {
                current = array[maybeInt]
            } else if let dictionary = current as? JSONDictionary {
                current = dictionary[String(component)]
            }
        }
        
        return current as? T
    }
}

public extension Array where Element == JSONDictionary {
    func resolve<T>(keyPath: Element.Key?, separator: String.Element = "/") -> T? {
        var current: Any? = self
        let keyPath = keyPath ?? Element.Key(separator)

        keyPath.split(separator: separator).forEach { component in
            if let maybeInt = Int(component), let array = current as? [Any] {
                current = array[maybeInt]
            } else if let dictionary = current as? JSONDictionary {
                current = dictionary[String(component)]
            }
        }
        
        return current as? T
    }
}

public final class ObservableDictionary<Key: Hashable, Value>: Collection, ObservableObject {
    public let objectWillChange = ObservableObjectPublisher()
    
    public typealias DictionaryType = [Key: Value]
    private var dictionary: DictionaryType {
        didSet {
            self.objectWillChange.send()
        }
    }
    
    public init(_ dictionary: [Key: Value]) {
        self.dictionary = dictionary
    }

    // Collection: these are the access methods
//    public typealias IndexDistance = DictionaryType.IndexDistance
    public typealias Indices = DictionaryType.Indices
    public typealias Iterator = DictionaryType.Iterator
    public typealias SubSequence = DictionaryType.SubSequence
    
    public var startIndex: Index {
        self.dictionary.startIndex
    }
    
    public var endIndex: DictionaryType.Index {
        self.dictionary.endIndex
    }
    
    public subscript(position: Index) -> Iterator.Element {
        self.dictionary[position]
    }
    
    public subscript(bounds: Range<Index>) -> SubSequence {
        self.dictionary[bounds]
    }

    public var indices: Indices {
        self.dictionary.indices
    }
    
    public subscript(key: Key) -> Value? {
        get {
            self.dictionary[key]
        }
        set {
            self.dictionary[key] = newValue
        }
    }

    public func index(after i: Index) -> Index {
        self.dictionary.index(after: i)
    }
    
    // Sequence: iteration is implemented here
    public func makeIterator() -> DictionaryIterator<Key, Value> {
        self.dictionary.makeIterator()
    }
    
    // IndexableBase
    public typealias Index = DictionaryType.Index
    
    public func resolve<T>(keyPath: String, separator: String.Element = ".") -> T? where Key == String, Value == Any {
        self.dictionary.resolve(keyPath: keyPath, separator: separator)
    }
}

var dictionary: [String: Any] = [:] {
    didSet {
        print("modifying dictionary")
    }
}

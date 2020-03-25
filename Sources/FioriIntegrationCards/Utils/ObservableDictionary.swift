//
//  ObservableDictionary.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/26/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
import Combine
import AnyCodable


extension Dictionary where Key == String, Value == Any {
    public func resolve<T>(keyPath: Key?, separator: String.Element = "/") -> T? {
        var current: Any? = self
        let keyPath = keyPath ?? Key(separator)
        
        keyPath.split(separator: separator).forEach { component in
            if let maybeInt = Int(component), let array = current as? Array<Any> {
                current = array[maybeInt]
            } else if let dictionary = current as? JSONDictionary {
                current = dictionary[String(component)]
            }
        }
        
        return current as? T
    }
}

extension Array where Element == JSONDictionary {
    public func resolve<T>(keyPath: Element.Key?, separator: String.Element = "/") -> T? {
        var current: Any? = self
        let keyPath = keyPath ?? Element.Key(separator)

        keyPath.split(separator: separator).forEach { component in
            if let maybeInt = Int(component), let array = current as? Array<Any> {
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
    
    public typealias DictionaryType = Dictionary<Key, Value>
    private var dictionary: DictionaryType {
        didSet {
            objectWillChange.send()
        }
    }
    
    public init(_ dictionary: Dictionary<Key, Value>) {
        self.dictionary = dictionary
    }
    //Collection: these are the access methods
//    public typealias IndexDistance = DictionaryType.IndexDistance
    public typealias Indices = DictionaryType.Indices
    public typealias Iterator = DictionaryType.Iterator
    public typealias SubSequence = DictionaryType.SubSequence
    
    public var startIndex: Index {
        return dictionary.startIndex
    }
    
    public var endIndex: DictionaryType.Index {
        return dictionary.endIndex
    }
    
    public subscript(position: Index) -> Iterator.Element {
        return dictionary[position]
    }
    
    public subscript(bounds: Range<Index>) -> SubSequence {
        return dictionary[bounds]
    }
    public var indices: Indices {
        return dictionary.indices
    }
    
    public subscript(key: Key)->Value? {
        get {
            return dictionary[key]
        }
        set {
            dictionary[key] = newValue
        }
    }
    public func index(after i: Index) -> Index {
        return dictionary.index(after: i)
    }
    
    //Sequence: iteration is implemented here
    public func makeIterator() -> DictionaryIterator<Key, Value> {
        return dictionary.makeIterator()
    }
    
    //IndexableBase
    public typealias Index = DictionaryType.Index
    
    public func resolve<T>(keyPath: String, separator: String.Element = ".") -> T? where Key == String, Value == Any {
        return dictionary.resolve(keyPath: keyPath, separator: separator)
    }
}

var dictionary: [String: Any] = [:] {
    didSet {
        print("modifying dictionary")
    }
}

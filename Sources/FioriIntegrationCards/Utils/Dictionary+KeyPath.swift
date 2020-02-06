//
//  Dictionary+KeyPath.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/20/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation
import AnyCodable
/*
extension Dictionary where Key: Hashable, Value: Any {
    func getValue(forKeyPath components : Array<Any>) -> Any? {
        
        switch components.count {
        case 0: return nil
        case 1:
            guard let string = components.first as? Key else { return nil }
            return self[string]
        default:
            var comps = components;
            let key = comps.remove(at: 0)
            if let k = key as? Key {
                if(comps.count == 0) {
                    return self[k]
                }
                if let v = self[k] as? Dictionary<AnyHashable,Any> {
                    return v.getValue(forKeyPath : comps)
                }
            }
            return nil
        }
    }
    
}

extension Dictionary where Key: Hashable, Value == Array<AnyCodable> {
    
    func getSequenceValue(forKeyPath components: Array<Any>) -> Array<AnyCodable>? {
        switch components.count {
        case 0:
            return nil
        case 1:
            guard let key = components.first as? Key else { return nil }
            return self[key]
        default:
            return nil
        }
    }
}
*/

///TODO: Open Source
// from here: https://github.com/onmyway133/Omnia, used under MIT license
public typealias JSONDictionary = [String: Any]
public typealias JSONArray = [JSONDictionary]

public func resolve<T>(_ jsonDictionary: [String: Any], keyPath: String, separator: String.Element = ".") -> T? {
    var current: Any? = jsonDictionary
    
    keyPath.split(separator: separator).forEach { component in
        if let maybeInt = Int(component), let array = current as? Array<Any> {
            current = array[maybeInt]
        } else if let dictionary = current as? JSONDictionary {
            current = dictionary[String(component)]
        }
    }
    
    return current as? T
}

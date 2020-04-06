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

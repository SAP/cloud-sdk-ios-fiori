//
//  MustacheRegex.swift
//  SwiftUI-Cards
//
//  Created by Stadelman, Stan on 11/19/19.
//  Copyright © 2019 sap. All rights reserved.
//

import Foundation

extension Array where Element == NSRange {
    func maxRange() -> Int {
        return self.reduce(0) { (prev, next) in
            let maxNext = NSMaxRange(next)
            return Swift.max(prev, maxNext)
        }
    }
}

extension String {
    
    private static let mustacheRegex = try! NSRegularExpression(pattern: #"\{\{?(?<mustache>(#[a-zA-Z0-9\/])?[a-zA-Z0-9\/]+.[a-zA-Z0-9\/])*\}?\}"#, options: [])
    private static let mustacheKeyname = "mustache"
    
    func mustachePlaceholders() -> [(String, NSRange)] {
        var shouldStop = false
        var placeholders: [(keyname: String, replacementRange: NSRange)] = []
        var counterIndex: Int = 0
        while !shouldStop {
            guard counterIndex < self.count else { shouldStop = true; break }
            if let match = String.mustacheRegex.firstMatch(in: self, options: [], range: NSRange(counterIndex..<self.count)) {
                let range = match.range(withName: String.mustacheKeyname)
                if range.location != NSNotFound {
                    placeholders.append((keyname: NSString(string: self).substring(with: range), replacementRange: match.range))
                }
            } else { shouldStop = true; break }
            counterIndex = placeholders.map({ $0.replacementRange }).maxRange() + 1
        }
        return placeholders
    }
    
    func replacingPlaceholders(withValuesIn dictionary: Dictionary<String, Any>) -> String {
        var mutableString = self
        // identify the keys and ranges of the mustache placeholders
        let substitutions = mutableString.mustachePlaceholders()
        // work from back-to-front, to avoid distrupting downstream ranges (avoids recomputing placeholders)
        for sub in substitutions.reversed() {
            // split on `/`, to support multi-level key paths
//            let keyPath = sub.0.split(separator: "/").map { String($0) }
            // feed keypath to utility, to read from [String: Any] structure, to get substitute value
            
            if let value: String = resolve(dictionary, keyPath: sub.0, separator: "/") {
//            if let value = dictionary.getValue(forKeyPath: keyPath) as? String {
                mutableString = mutableString.replacingCharacters(in: Range(sub.1, in: mutableString)!, with: value)
            }
        }
        return mutableString
    }
    
    func replacingPlaceholdersToDouble(withValuesIn dictionary: Dictionary<String, Any>) -> Double {
        var mutableString = self
        // identify the keys and ranges of the mustache placeholders
        let substitutions = mutableString.mustachePlaceholders()
        // work from back-to-front, to avoid distrupting downstream ranges (avoids recomputing placeholders)
        for sub in substitutions.reversed() {
            // split on `/`, to support multi-level key paths
            //            let keyPath = sub.0.split(separator: "/").map { String($0) }
            // feed keypath to utility, to read from [String: Any] structure, to get substitute valuex
            
            if let value: Double = resolve(dictionary, keyPath: sub.0, separator: "/") {
                //            if let value = dictionary.getValue(forKeyPath: keyPath) as? String {
                mutableString = mutableString.replacingCharacters(in: Range(sub.1, in: mutableString)!, with: String(value))
            } else if let value: Int = resolve(dictionary, keyPath: sub.0, separator: "/") {
                //            if let value = dictionary.getValue(forKeyPath: keyPath) as? String {
                mutableString = mutableString.replacingCharacters(in: Range(sub.1, in: mutableString)!, with: String(value))
            }
        }
        return Double(mutableString)!
    }
    
    func replacingPlaceholdersToBoolean(withValuesIn dictionary: Dictionary<String, Any>) -> Bool {
        var mutableString = self
        // identify the keys and ranges of the mustache placeholders
        let substitutions = mutableString.mustachePlaceholders()
        // work from back-to-front, to avoid distrupting downstream ranges (avoids recomputing placeholders)
        for sub in substitutions.reversed() {
            // split on `/`, to support multi-level key paths
            //            let keyPath = sub.0.split(separator: "/").map { String($0) }
            // feed keypath to utility, to read from [String: Any] structure, to get substitute value
            
            if let value: Bool = resolve(dictionary, keyPath: sub.0, separator: "/") {
                //            if let value = dictionary.getValue(forKeyPath: keyPath) as? String {
                let boolString = value ? "true" : "false"
                mutableString = mutableString.replacingCharacters(in: Range(sub.1, in: mutableString)!, with: boolString)
            }
        }
        return Bool(mutableString)!
    }
}

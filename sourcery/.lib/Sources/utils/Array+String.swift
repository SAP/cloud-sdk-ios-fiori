//
//  File.swift
//  
//
//  Created by Stadelman, Stan on 12/14/20.
//

import Foundation

extension Array where Element == String {
    func valuesBeforeColon() -> Array<Element> {
        compactMap({
            guard let split = $0.split(separator: ":")
            .map({ $0.trimmingCharacters(in: .whitespacesAndNewlines) })
            .first else { return nil }
            return String(split)
        })
    }
}

extension Array where Element == String {
    public var viewModifierPropertyDecls: String {
        map({ "@Environment(\\.\($0)Modifier) private var \($0)Modifier" }).joined(separator: "\n\t")
    }
}

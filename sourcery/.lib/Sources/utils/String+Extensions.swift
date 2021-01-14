//
//  File.swift
//  
//
//  Created by Stadelman, Stan on 12/14/20.
//

import Foundation

extension String {
    public func capitalizingFirst() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    public func lowercasingFirst() -> String {
        return prefix(1).lowercased() + dropFirst()
    }
}

//
//  NumberFormatter+Extensions.swift
//  
//
//  Created by Eidinger, Marco on 6/26/20.
//

import Foundation

public extension NumberFormatter {
    convenience init(style: NumberFormatter.Style) {
        self.init()
        self.numberStyle = style
    }
}

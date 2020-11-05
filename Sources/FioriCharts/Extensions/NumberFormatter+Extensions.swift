//
//  NumberFormatter+Extensions.swift
//  
//
//  Created by Eidinger, Marco on 6/26/20.
//

import Foundation

extension NumberFormatter {
    /// init with a style
    convenience init(style: NumberFormatter.Style) {
        self.init()
        self.numberStyle = style
    }
}

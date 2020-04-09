//
//  String+Extensions.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/11/20.
//

import Foundation
import SwiftUI

extension String {
    func boundingBoxSize(with fontSize: Double) -> CGSize {
        #if os(iOS) || os(tvOS) || os(watchOS)
        let font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        #elseif os(macOS)
        let font = NSFont.systemFont(ofSize: CGFloat(fontSize))
        #endif
        
        let size = (self as NSString)
            .boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)),
                          options: .usesLineFragmentOrigin,
                          attributes: [NSAttributedString.Key.font: font],
                          context: nil).size
        
        return size
    }
}

//
//  String+Extensions.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 3/11/20.
//

import Foundation
import SwiftUI
import UIKit

extension String {
    func boundingBoxSize(with fontSize: Double) -> CGSize {
        let font = UIFont.systemFont(ofSize: CGFloat(fontSize))
        
        let size = (self as NSString)
            .boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)),
                          options: .usesLineFragmentOrigin,
                          attributes: [NSAttributedString.Key.font: font],
                          context: nil).size
        
        return size
    }
}

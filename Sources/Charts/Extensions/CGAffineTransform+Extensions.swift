//
//  CGAffineTransform+Extensions.swift
//  Micro Charts
//
//  Created by Stan Stadelman on 12/5/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import CoreGraphics

extension CGAffineTransform {
    static func inverted(in height: CGFloat) -> CGAffineTransform {
        return CGAffineTransform(scaleX: 1, y: -1).translatedBy(x: 0, y: -height)
    }
}

//
//  TwoDChart.swift
//  Micro Charts
//
//  Created by Stan Stadelman on 12/7/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import CoreGraphics

protocol TwoDChart {
    var value: CGFloat { get }
    var range: ClosedRange<CGFloat> { get }
}

extension TwoDChart{
    var normalizedValue: CGFloat {
        return normalizedValue(for: value)
    }
    
    func normalizedValue(for value: CGFloat) -> CGFloat {
        return (value - range.lowerBound) / (range.upperBound - range.lowerBound)
    }
}

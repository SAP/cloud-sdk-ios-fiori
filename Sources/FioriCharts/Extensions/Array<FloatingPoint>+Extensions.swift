//
//  Array<FloatingPoint>+Extensions.swift
//  Micro Charts
//
//  Created by Stan Stadelman on 12/5/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import Foundation

extension Array where Element: FloatingPoint {
    func normalized(in maxValue: Element) -> [Element] {
        return self.map { $0 / maxValue }
    }
    
    func normalized(in range: ClosedRange<Element>) -> [Element] {
        let breadth = range.upperBound - range.lowerBound
        return self.normalized(in: breadth).map { $0 + range.lowerBound }
    }
}

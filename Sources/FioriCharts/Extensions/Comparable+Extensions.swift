//
//  Comparable+Extensions.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 7/23/20.
//

import Foundation

extension Comparable {
    func clamp(low: Self, high: Self) -> Self {
        if self > high {
            return high
        } else if self < low {
            return low
        }
        
        return self
    }
}


//
//  BulletMicroChartModel.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/10/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI

public class BulletMicroChartModel: ObservableObject, Identifiable {

    @Published public var targetValue: CGFloat?
    @Published public var forecastValue: CGFloat?
    @Published public var actual: MicroChartDataItem?
    @Published public var thresholds: [MicroChartDataItem]
    public let id = UUID()
    
    var range: ClosedRange<CGFloat>
    
    public func normalizedValue(for initial: CGFloat) -> CGFloat {
        return (initial - range.lowerBound) / (range.upperBound - range.lowerBound)
    }
    
    init(targetValue: CGFloat?, forecastValue: CGFloat? = nil, actual: MicroChartDataItem?, thresholds: [MicroChartDataItem] = []) {
        self.targetValue = targetValue
        self.forecastValue = forecastValue
        self.actual = actual
        self.thresholds = thresholds
        
        let range: ClosedRange<CGFloat> = {
            let allValues: [CGFloat] = [
                [targetValue, forecastValue, actual?.value].compactMap({ $0 }),
                thresholds.map ({ $0.value })]
                .compactMap({ $0 })
                .flatMap({ $0 })
            
            let min = allValues.min() ?? 0
            let max = allValues.max() ?? 1
            
            //print("ACT ALL VALUES: \(allValues)")
            guard min != max else { return 0...max }
            return min...max
        }()
        
        self.range = range
    }
}

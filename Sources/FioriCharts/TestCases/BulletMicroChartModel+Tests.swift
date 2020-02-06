//
//  BulletMicroChartModel+Tests.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/11/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import Foundation

extension BulletMicroChartModel {
    static let bulletTest1 = BulletMicroChartModel(targetValue: 100,
                 forecastValue: 110,
                 actual: MicroChartDataItem(value: 120, color: .green),
                 thresholds: [
                    MicroChartDataItem(value: 0, color: .red),
                    MicroChartDataItem(value: 50, color: .yellow),
                    MicroChartDataItem(value: 150, color: .yellow),
                    MicroChartDataItem(value: 200, color: .red)
                ])
    
    
    static let bulletTest2 = BulletMicroChartModel(targetValue: 50,
                 forecastValue: 70,
                 actual: MicroChartDataItem(value: 35, color: .green),
                 thresholds: [
                    MicroChartDataItem(value: 0, color: .red),
                    MicroChartDataItem(value: 20, color: .yellow),
                    MicroChartDataItem(value: 50, color: .yellow),
                    MicroChartDataItem(value: 100, color: .red)
                ])
    
    public static let allCases = [bulletTest1, bulletTest2]
}

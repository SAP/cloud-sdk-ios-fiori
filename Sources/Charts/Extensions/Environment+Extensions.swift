//
//  Environment+Extensions.swift
//  Micro Charts
//
//  Created by Stan Stadelman on 12/5/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

struct ChartBoundaryKey: EnvironmentKey {
    static let defaultValue: CGRect = .zero
}

extension EnvironmentValues {
    var chartBoundingBox: CGRect {
        get { return self[ChartBoundaryKey.self] }
        set { self[ChartBoundaryKey.self] = newValue }
    }
}

/*extension EnvironmentValues {
    var bulletMicroChartModel: BulletMicroChart.Model {
        get { return self[BulletMicroChart.ModelKey.self] }
        set { self[BulletMicroChart.ModelKey.self] = newValue }
    }
}*/

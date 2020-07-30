//
//  RadialChartSnapshotTests.swift
//  ExamplesTests
//
//  Created by Eidinger, Marco on 7/27/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import XCTest
import SwiftUI
@testable import FioriCharts

private let referenceSize = CGSize(width: 500, height: 300)

class RadialChartSnapshotTests: XCTestCase {

    func testRadialChartStandard() throws {
        assertSnapshot(ChartView(Tests.radialModels[0]), for: referenceSize)
    }

    func testRadialChartNintyNinePercent() throws{
        assertSnapshot(ChartView(Tests.radialModels[1]), for: referenceSize)
    }

    func testRadialChartTenPercent() throws{
        assertSnapshot(ChartView(Tests.radialModels[2]), for: referenceSize)
    }

    func testRadialChartZeroPercent() throws{
        assertSnapshot(ChartView(Tests.radialModels[3]), for: referenceSize)
    }

}

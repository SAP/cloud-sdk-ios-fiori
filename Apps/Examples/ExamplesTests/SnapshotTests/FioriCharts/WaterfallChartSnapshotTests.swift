//
//  WaterfallChartSnapshotTests.swift
//  ExamplesTests
//
//  Created by Eidinger, Marco on 7/16/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import XCTest
import Foundation

import SwiftUI
@testable import FioriCharts

private let referenceSize = CGSize(width: 500, height: 300)

class WaterfallChartSnapshotTests: XCTestCase {

    func testWaterfallChart1() throws {
        // Headcount Movement Last 12 Months, 5 is the total index
        assertSnapshot(ChartView(Tests.waterfallModels[0]), for: referenceSize)
    }

    func testWaterfallChart2() throws {
        // Headcount Movement Last 12 Months, 2 and 5 are total indexes
        assertSnapshot(ChartView(Tests.waterfallModels[1]), for: referenceSize)
    }

    func testWaterfallChart3() throws{
        // Headcount Movement Last 12 Months, explicitMax = 100
        assertSnapshot(ChartView(Tests.waterfallModels[2]), for: referenceSize)
    }

    func testWaterfallChart4() throws {
        // Headcount Movement Last 12 Months, negative value
        assertSnapshot(ChartView(Tests.waterfallModels[3]), for: referenceSize)
    }
    
    func testWaterfallChart5() throws {
        // Headcount Movement Last 12 Months, negative value
        assertSnapshot(ChartView(Tests.waterfallModels[4]), for: referenceSize)
    }
    
    func testWaterfallChart6() throws {
        // Headcount Movement Last 12 Months, negative value
        assertSnapshot(ChartView(Tests.waterfallModels[5]), for: referenceSize)
    }
    
    func testWaterfallChart7() throws {
        // Headcount Movement Last 12 Months, negative value
        assertSnapshot(ChartView(Tests.waterfallModels[6]), for: referenceSize)
    }
    
    func testWaterfallChart8() throws {
        // Headcount Movement Last 12 Months, negative value
        assertSnapshot(ChartView(Tests.waterfallModels[7]), for: referenceSize)
    }
}

//
//  StockChartSnapshotTests.swift
//  ExamplesTests
//
//  Created by Eidinger, Marco on 7/27/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import XCTest
import SwiftUI
@testable import FioriCharts

private let referenceSize = CGSize(width: 500, height: 300)

class StockChartSnapshotTests: XCTestCase {

    func testStockChartSimple() throws {
        assertSnapshot(ChartView(Tests.stockModels[1]), for: referenceSize)
    }

    func testStockChartIntraday() throws{
        assertSnapshot(ChartView(Tests.stockModels[2]), for: referenceSize)
    }

    func testStockChart3DimensionData() throws{
        assertSnapshot(ChartView(Tests.stockModels[3]), for: referenceSize)
    }

    func testStockChartStandard() throws{
        assertSnapshot(ChartView(Tests.stockModels[4]), for: referenceSize)
    }

}

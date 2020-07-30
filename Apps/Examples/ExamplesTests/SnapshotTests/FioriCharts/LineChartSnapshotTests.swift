//
//  GenLineChartSnapshotTests.swift
//  
//
//  Created by Eidinger, Marco on 7/15/20.
//

import XCTest
import SwiftUI
@testable import FioriCharts

private let referenceSize = CGSize(width: 500, height: 300)

class LineChartSnapshotTests: XCTestCase {

    func testLineChartPositiveValuesSingleSeries() throws {
        assertSnapshot(ChartView(Tests.lineModels[0]), for: referenceSize)
    }

    func testLineChartPositiveValuesSecondaryYAxis() throws {
        assertSnapshot(ChartView(Tests.lineModels[1]), for: referenceSize)
    }

    func testLineChart6SeriesLongCategoryLabels() throws{
        assertSnapshot(ChartView(Tests.lineModels[2]), for: referenceSize)
    }

    func testLineChartNegativeValuesSingleSelection() throws {
        assertSnapshot(ChartView(Tests.lineModels[3]), for: referenceSize)
    }
}

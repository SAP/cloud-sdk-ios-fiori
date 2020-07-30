//
//  ColumnChartSnapshotTests.swift
//  ExamplesTests
//
//  Created by Eidinger, Marco on 7/27/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import XCTest
import SwiftUI
@testable import FioriCharts

private let referenceSize = CGSize(width: 500, height: 300)

class ColumnChartSnapshotTests: XCTestCase {

    func testColumnChartPositiveValues() throws {
        assertSnapshot(ChartView(Tests.columnModels[0]), for: referenceSize)
    }

    func testColumnChartLabelsForDimensions() throws{
        assertSnapshot(ChartView(Tests.columnModels[1]), for: referenceSize)
    }

    func testColumnChartMixedValuesAndLabelsForDimensions() throws {
        assertSnapshot(ChartView(Tests.columnModels[2]), for: referenceSize)
    }
}

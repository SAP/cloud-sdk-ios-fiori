//
//  ComboChartSnapshotTests.swift
//  ExamplesTests
//
//  Created by Eidinger, Marco on 7/27/20.
//  Copyright © 2020 SAP. All rights reserved.
//

import XCTest
import SwiftUI
@testable import FioriCharts

private let referenceSize = CGSize(width: 500, height: 300)

class ComboChartSnapshotTests: XCTestCase {

    func testComboChartPositiveValuesSecondaryYAxis() throws {
        assertSnapshot(ChartView(Tests.comboModels[0]), for: referenceSize)
    }

    func testComboChart6SeriesLongCategoryLabels() throws{
        assertSnapshot(ChartView(Tests.comboModels[1]), for: referenceSize)
    }

    func testComboChartNegativeValuesSingleSelection() throws {
        assertSnapshot(ChartView(Tests.comboModels[2]), for: referenceSize)
    }
}

@testable import FioriCharts
import SwiftUI
import XCTest

private let referenceSize = CGSize(width: 500, height: 300)

/// this is actually micro column chart snapshot tests
class ColumnChartSnapshotTests: XCTestCase {
    func testColumnChartPositiveValues() throws {
        assertSnapshot(ChartView(Tests.columnModels[0]), for: referenceSize)
    }

    func testColumnChartLabelsForDimensions() throws {
        assertSnapshot(ChartView(Tests.columnModels[1]), for: referenceSize)
    }

    func testColumnChartMixedValuesAndLabelsForDimensions() throws {
        assertSnapshot(ChartView(Tests.columnModels[2]), for: referenceSize)
    }
}

@testable import FioriCharts
import SwiftUI
import XCTest

private let referenceSize = CGSize(width: 500, height: 300)

class ComboChartSnapshotTests: XCTestCase {
    func testComboChartPositiveValuesSecondaryYAxis() throws {
        assertSnapshot(ChartView(Tests.comboModels[0]), for: referenceSize)
    }

    func testComboChart6SeriesLongCategoryLabels() throws {
        assertSnapshot(ChartView(Tests.comboModels[1]), for: referenceSize)
    }

    func testComboChartNegativeValuesSingleSelection() throws {
        assertSnapshot(ChartView(Tests.comboModels[2]), for: referenceSize)
    }
    
    func testComboChartMixedValuesRangeSelection() throws {
        assertSnapshot(ChartView(Tests.comboModels[3]), for: referenceSize)
    }
    
    func testComboChartDataArrayEmpty() throws {
        assertSnapshot(ChartView(Tests.comboModels[4]), for: referenceSize)
    }
}

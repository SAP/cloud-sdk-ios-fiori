@testable import FioriCharts
import SwiftUI
import XCTest

private let referenceSize = CGSize(width: 500, height: 300)

class LineChartSnapshotTests: XCTestCase {
    func testLineChartPositiveValuesSingleSeries() throws {
        assertSnapshot(ChartView(Tests.lineModels[0]), for: referenceSize)
    }

    func testLineChartPositiveValuesSecondaryYAxis() throws {
        assertSnapshot(ChartView(Tests.lineModels[1]), for: referenceSize)
    }

    func testLineChart6SeriesLongCategoryLabels() throws {
        assertSnapshot(ChartView(Tests.lineModels[2]), for: referenceSize)
    }

    func testLineChartNegativeValuesSingleSelection() throws {
        assertSnapshot(ChartView(Tests.lineModels[3]), for: referenceSize)
    }
    
    func testLineChartMixedValuesRangeSelection() throws {
        assertSnapshot(ChartView(Tests.lineModels[4]), for: referenceSize)
    }
    
    func testLineChartMixedValuesCustomSeriesAttributes() throws {
        assertSnapshot(ChartView(Tests.lineModels[5]), for: referenceSize)
    }
    
    func testLineChartLongXAxisLabels() throws {
        assertSnapshot(ChartView(Tests.lineModels[6]), for: referenceSize)
    }
    
    func testLineChartContinuousNilValues() throws {
        assertSnapshot(ChartView(Tests.lineModels[7]), for: referenceSize)
    }
    
    func testLineChartDiscreteNilValues() throws {
        assertSnapshot(ChartView(Tests.lineModels[8]), for: referenceSize)
    }
    
    func testLineChartDataArrayWithSingleNil() throws {
        assertSnapshot(ChartView(Tests.lineModels[10]), for: referenceSize)
    }
    
    func testLineChartDataArrayEmpty() throws {
        assertSnapshot(ChartView(Tests.lineModels[11]), for: referenceSize)
    }
}

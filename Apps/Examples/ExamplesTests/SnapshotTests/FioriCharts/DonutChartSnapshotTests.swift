@testable import FioriCharts
import SwiftUI
import XCTest

private let referenceSize = CGSize(width: 500, height: 300)

class DonutChartSnapshotTests: XCTestCase {
    func testDonutChart() throws {
        assertSnapshot(ChartView(Tests.donutModels[0]), for: referenceSize)
    }

    func testDonutChartCustomizedColorsForSegments() throws {
        assertSnapshot(ChartView(Tests.donutModels[1]), for: referenceSize)
    }
    
    func testDonutChartWithNegativeValue() throws {
        assertSnapshot(ChartView(Tests.donutModels[2]), for: referenceSize)
    }
    
    func testDonutChartWithOneSegment() throws {
        assertSnapshot(ChartView(Tests.donutModels[3]), for: referenceSize)
    }
    
    func testDonutChartWithTwoSegments() throws {
        assertSnapshot(ChartView(Tests.donutModels[4]), for: referenceSize)
    }
}

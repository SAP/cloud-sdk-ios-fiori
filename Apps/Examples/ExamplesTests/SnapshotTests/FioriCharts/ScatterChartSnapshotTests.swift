@testable import FioriCharts
import SwiftUI
import XCTest

private let referenceSize = CGSize(width: 500, height: 300)

class ScatterChartSnapshotTests: XCTestCase {
    func testScatterChart1() throws {
        // Headcount Movement Last 12 Months, 5 is the total index
        assertSnapshot(ChartView(Tests.scatterModels[0]), for: referenceSize)
    }

    func testScatterChart2() throws {
        // Headcount Movement Last 12 Months, 2 and 5 are total indexes
        assertSnapshot(ChartView(Tests.scatterModels[1]), for: referenceSize)
    }

    func testScatterChart3() throws {
        // Headcount Movement Last 12 Months, explicitMax = 100
        assertSnapshot(ChartView(Tests.scatterModels[2]), for: referenceSize)
    }

    func testScatterChart4() throws {
        // Headcount Movement Last 12 Months, negative value
        assertSnapshot(ChartView(Tests.scatterModels[3]), for: referenceSize)
    }
    
    func testScatterChart5() throws {
        // Headcount Movement Last 12 Months, negative value
        assertSnapshot(ChartView(Tests.scatterModels[4]), for: referenceSize)
    }
    
    func testScatterChart6() throws {
        // Headcount Movement Last 12 Months, negative value
        assertSnapshot(ChartView(Tests.scatterModels[5]), for: referenceSize)
    }
    
    func testScatterChart7() throws {
        // Headcount Movement Last 12 Months, negative value
        assertSnapshot(ChartView(Tests.scatterModels[6]), for: referenceSize)
    }
}

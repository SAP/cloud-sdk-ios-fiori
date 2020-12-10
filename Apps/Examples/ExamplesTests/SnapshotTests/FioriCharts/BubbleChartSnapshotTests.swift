@testable import FioriCharts
import SwiftUI
import XCTest

private let referenceSize = CGSize(width: 500, height: 300)

class BubbleChartSnapshotTests: XCTestCase {
    func testBubbleChart1() throws {
        // Headcount Movement Last 12 Months, 5 is the total index
        assertSnapshot(ChartView(Tests.bubbleModels[0]), for: referenceSize)
    }

    func testBubbleChart2() throws {
        // Headcount Movement Last 12 Months, 2 and 5 are total indexes
        assertSnapshot(ChartView(Tests.bubbleModels[1]), for: referenceSize)
    }

    func testBubbleChart3() throws {
        // Headcount Movement Last 12 Months, explicitMax = 100
        assertSnapshot(ChartView(Tests.bubbleModels[2]), for: referenceSize)
    }

    func testBubbleChart4() throws {
        // Headcount Movement Last 12 Months, negative value
        assertSnapshot(ChartView(Tests.bubbleModels[3]), for: referenceSize)
    }
    
    func testBubbleChart5() throws {
        // Headcount Movement Last 12 Months, negative value
        assertSnapshot(ChartView(Tests.bubbleModels[4]), for: referenceSize)
    }
    
    func testBubbleChart6() throws {
        // Headcount Movement Last 12 Months, negative value
        assertSnapshot(ChartView(Tests.bubbleModels[5]), for: referenceSize)
    }
    
    func testBubbleChart7() throws {
        // Headcount Movement Last 12 Months, negative value
        assertSnapshot(ChartView(Tests.bubbleModels[6]), for: referenceSize)
    }
}
